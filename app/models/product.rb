class Product < ApplicationRecord
  before_validation :generate_friendly_id, :on => :create

  searchkick text_start: [:title]

  validates_presence_of :title, :description, :body, :quantity, :price, :friendly_id
  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

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

  def to_param
    # "#{self.id}-#{self.title}"
    self.friendly_id
  end

  def search_data
    {
        title: title,
        description: description,
    }
  end

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end
end
