class CartItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product_id

  def update
    if @cart_item.product.quantity >= cart_item_params[:quantity].to_i
      @cart_item.update(cart_item_params)
      flash[:notice] = "You've successfully change the number!"
    else
      flash[:notice] = "The quantity is not enough to add to cart"
    end
    redirect_to :back
  end

  def destroy
    @cart_item.destroy
    @product = @cart_item.product
    # redirect_to :back
  end

  private

  def find_product_id
    @cart = current_cart
    @cart_item = @cart.cart_items.find_by(product_id: params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
