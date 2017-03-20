class Account::OrdersController < AdminController
  def index
    @orders = current_user.orders.order("id DESC")
  end
end
