class OrderMailer < ApplicationMailer
  before_action :find_order_and_user

  def notify_order_placed(order)
    mail(to: @user.email, subject: "[Debugsharing] thank you for complete this order, this is your product lists #{order.token} ")
  end

  def apply_cancell(order)
    mail(to: @user.email, subject: "[Debugsharing] User#{order.user.name} pulled a request to cancell order#{order.token}")
  end

  def notify_ship(order)
    mail(to: @user.email, subject: "[Debugsharing] Your order#{order.token} is shipping!")
  end

  def notify_cancell(order)
    mail(to: @user.email, subject: "[Debugsharing] Your order#{order.token} is cancelled!")
  end

  private

  def find_order_and_user
    @order = order
    @user = order.user
    @product_lists = @order.product_lists
  end
end
