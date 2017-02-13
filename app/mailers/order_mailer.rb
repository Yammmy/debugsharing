class OrderMailer < ApplicationMailer
  def notify_order_placed(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[Beautys] thank you for complete this order, this is your product lists #{order.token} ")
  end
end
