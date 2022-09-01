require 'sidekiq/web'

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, controllers: {
    sessions: 'admin_users/sessions'
  }, skip: %w[registrations]

  root to: 'application#redirect_to_sign_in'

  resources :admin_users, only: %w[#<WebFront:0x00007ffa4cf05750>]

  namespace :api do
  end

  namespace :dashboard do
    # TODO: customizable table name
    devise_for :admin_users, controllers: {
      sessions: 'dashboard/admin_users/sessions',
      passwords: 'dashboard/admin_users/passwords'
    }, skip: %w[registrations]

    resources :admin_users, only: %w[index show]
    resources :books, only: %w[index show] do
      resources :users, only: %w[index show]
    end
    resources :users, only: %w[index show] do
      resources :books, only: %w[index show]
    end
  end

  #API
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :books, only: %w[index]
      post '/user_books', to: 'books#user_books'
    end
  end

  get '*path' => redirect('/')

  unless Rails.env.development?
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      admin_username = ENV['SIDEKIQ_DASHBOARD_USERNAME']
      admin_password = ENV['SIDEKIQ_DASHBOARD_PASSWORD']
      ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(username),
        ::Digest::SHA256.hexdigest(admin_username)
      ) && ActiveSupport::SecurityUtils.secure_compare(
        ::Digest::SHA256.hexdigest(password),
        ::Digest::SHA256.hexdigest(admin_password)
      )
    end
  end
  mount Sidekiq::Web => '/sidekiq'
end
