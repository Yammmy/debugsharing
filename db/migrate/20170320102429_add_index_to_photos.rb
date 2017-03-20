class AddIndexToPhotos < ActiveRecord::Migration[5.0]
  def change
    add_index :photos, :product_id
    add_index :photos, :avatar
  end
end
