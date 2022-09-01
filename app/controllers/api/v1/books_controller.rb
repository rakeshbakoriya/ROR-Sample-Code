module Api
  module V1 
    class BooksController < BaseController
      before_action :set_user, only: :user_books
      before_action :set_book, only: :user_books

      def index
        render json: Book.search(params)
      end

      def user_books
        user_book = @user.user_books.build(book: @book)
        if user_book.save
          render json: {
            success: true,
            errors: [],
            user_book: {
              user: UserSerializer.new(@user).as_json,
              book: BookSerializer.new(@book).as_json
            }
          }, status: :created
        else
          render json: { success: false, errors: [{ message: user_book.errors.full_messages }]}, status: :unprocessable_entity
        end
      end

      private

      def set_user
        @user = User.find(params[:user_id])
        render json: { success: false, errors: [{ message: ["Couldn't find User with 'ID'=#{params[:user_id]}"] }]}, status: :not_found unless @user
      end

      def set_book
        @book = Book.find(params[:book_id])
        render json: { success: false, errors: [{ message: ["Couldn't find Book with 'ID'=#{params[:book_id]}"] }] }, status: :not_found unless @book
      end
    end

  end
end
