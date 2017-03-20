class AddIndexToProductList < ActiveRecord::Migration[5.0]
  def change
    add_index :product_lists, :order_id
    add_index :product_lists, :product_name
    add_index :product_lists, :product_price
    add_index :product_lists, :quantity
  end
end
