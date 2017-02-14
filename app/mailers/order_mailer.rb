class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Beautys] thank you for complete this order, this is your product lists #{order.token} ")
  end

  def apply_cancell(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@gmail.com", subject: "[Beautys] User#{order.user.name} pulled a request to cancell order#{order.token}")
  end

  def notify_ship(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Beautys] Your order#{order.token} is shipping!")
  end

  def notify_cancell(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Beautys] Your order#{order.token} is cancelled!")
  end
end
