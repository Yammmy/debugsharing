class CartsController < ApplicationController
  def clear_cart
    current_cart.clear!
    redirect_to :back
    flash[:warning] = "You've clear the cart!"
  end

  def checkout
    if !current_cart.cart_item_ids.empty?
      @order = Order.new
    else
      flash[:alert] = "There is no products in your cart yet."
      redirect_to :back
    end
  end

end
