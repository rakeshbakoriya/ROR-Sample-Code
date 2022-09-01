class User < ApplicationRecord
  validates :email, :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :user_books
  has_many :books, through: :user_books
end
