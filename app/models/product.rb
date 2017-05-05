class Product < ApplicationRecord
  searchkick text_start: [:title]

  validates_presence_of :title, :description, :body, :quantity, :price

  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user

  acts_as_votable

  has_many :photos
  accepts_nested_attributes_for :photos

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def search_data
    {
        title: title,
        description: description,
    }
  end
end
