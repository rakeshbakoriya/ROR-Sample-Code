class Book < ApplicationRecord
  validates :title, :author, presence: true, length: { minimum: 2 }
  validates :description, presence: true, length: { minimum: 100 }

  has_many :user_books
  has_many :users, through: :user_books

  scope :get_records, -> (conditions) {
    joins(:users).where(conditions)
  }

  def self.search(params)
    self.get_records(self.searching_canditions(params))
  end

  def self.searching_canditions(params)
    if params[:query].present?
      query_str = "books.title like '%#{params[:query]}%' or books.description like '%#{params[:query]}%' or users.name like '%#{params[:query]}%'"
    else
      query_str = ""
      if params[:book].present?
        query_str += "books.title like '%#{params[:book][:title]}%' and " if params[:book][:title].present?
        query_str += "books.description like '%#{params[:book][:description]}%' and " if params[:book][:description].present?
      end
      query_str += "users.name like '%#{params[:user][:name]}%'" if params[:user].present? && params[:user][:name].present?
      query_str = query_str.strip.chop.chop.chop if query_str.strip.last(3) == "and"
      query_str
    end
  end

end
