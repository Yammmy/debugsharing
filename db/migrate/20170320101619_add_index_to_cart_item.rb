class AddIndexToCartItem < ActiveRecord::Migration[5.0]
  def change
    add_index :cart_items, :cart_id
    add_index :cart_items, :product_id
    add_index :cart_items, :quantity
  end
end
