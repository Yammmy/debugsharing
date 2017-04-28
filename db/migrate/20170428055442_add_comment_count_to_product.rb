class AddCommentCountToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :comments_count, :integer, default: 0

    Product.pluck(:id).each do |i|
      Product.reset_counters(i, :comments)
    end
  end
end
