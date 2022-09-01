module Search
  class GlobalService
    attr_reader :errors

    def initialize(klass, params)
      @search_query = params[:q]
      @order_query = params[:o]
      @direction_query = params[:d]
      @params = params
      @records = load_records(klass, params)
    end

    def execute
      paginate
      order
      @records
    end

    def load_records(klass, params)
      if klass == 'book' && params[:user_id].present?
        user = User.find(params[:user_id])
        user.books
      elsif klass == 'user' && params[:book_id].present?
        book = Book.find(params[:book_id])
        book.users
      else
        klass.classify.constantize.all
      end
    end

    private

    def paginate
      @records = @records.page(@params[:page])
                         .extending(JsonPaginatable)
    end

    def order
      if @order_query.present? && @direction_query.present?
        @records = @records.order(@order_query => @direction_query)
        return
      end
      @records = @records.order(created_at: :desc)
    end
  end
end
