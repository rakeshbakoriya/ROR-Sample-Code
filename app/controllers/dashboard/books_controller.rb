module Dashboard
  class BooksController < BaseController
    before_action :set_book, only: :show
    helper_method :order_params

    def index
      service = Search::GlobalService.new("book", params)
      @books = service.execute
    end

    def show; end

    def order_params(order, direction)
      params.merge(o: order, d: direction, page: params[:page], user_id: params[:user_id]).permit(:o, :d, :page, :user_id)
    end

    private

    def set_book
      @book = Book.find_by(id: params[:id])
    end

  end
end
