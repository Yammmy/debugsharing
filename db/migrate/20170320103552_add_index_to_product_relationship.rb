class AddIndexToProductRelationship < ActiveRecord::Migration[5.0]
  def change
    add_index :product_relationships, :user_id
    add_index :product_relationships, :product_id
  end
end
