class CartsController < ApplicationController
  def clear_cart
    current_cart.clear!
    redirect_to :back
    flash[:warning] = "You've clear the cart!"
  end

  def checkout
    @order = Order.new
  end

end
