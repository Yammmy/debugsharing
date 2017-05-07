class FixCategoryToProducts < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :category, :category_id
    add_index     :products, :category_id
  end
end
