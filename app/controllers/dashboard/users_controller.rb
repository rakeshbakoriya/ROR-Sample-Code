module Dashboard
  class UsersController < BaseController
    before_action :set_user, only: :show
    helper_method :order_params

    def index
      service = Search::GlobalService.new("user", params)
      @users = service.execute
    end

    def show; end

    def order_params(order, direction)
      params.merge(o: order, d: direction, page: params[:page]).permit(:o, :d, :page)
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
    end

  end
end
