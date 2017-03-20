class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :find_token, only: [:show, :pay_with_alipay, :pay_with_wechat]


  def show
    @product_lists = @order.product_lists
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = current_cart.total_price

    if @order.save
      current_cart.cart_items.each do |cart_item|
        product_list = ProductList.new
        product_list.order = @order
        product_list.product_name = cart_item.product.title
        product_list.product_price = cart_item.product.price
        product_list.quantity = cart_item.quantity
        product_list.save
      end

      current_cart.clear!
      OrderMailer.notify_order_placed(@order).deliver!

      redirect_to order_path(@order.token)
    else
      render 'carts/checkout'
    end
  end

  def pay_with_alipay
    @order.set_payment_with!("alipay")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "Successfully payed with alipay!"
  end

  def pay_with_wechat
    @order.set_payment_with!("wechat")
    @order.make_payment!

    redirect_to order_path(@order.token), notice: "Successfully payed with wechat!"
  end

  def apply_to_cancell
    @order = Order.find(params[:id])
    OrderMailer.apply_cancell(@order).deliver!
    flash[:notice] = "Pulled request already!"
    redirect_to :back
  end

  private

  def find_token
    @order = Order.find_by_token(params[:id])
  end

  def order_params
    params.require(:order).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
