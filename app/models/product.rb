class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_many :comments, dependent: :destroy
  has_many :product_relationships
  has_many :members, through: :product_relationships, source: :user

  acts_as_votable

  has_many :photos
  accepts_nested_attributes_for :photos
end
