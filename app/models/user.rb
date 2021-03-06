class User < ApplicationRecord
  acts_as_messageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def admin?
    is_admin
  end

  def mailboxer_email(object)
    email
  end

  has_many :orders
  has_many :comments
  has_many :product_relationships
  has_many :collected_products, through: :product_relationships, source: :product

  def has_collected?(product)
    collected_products.include?(product)
  end

  def collect!(product)
    collected_products << product
  end

  def discollect!(product)
    collected_products.delete(product)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/profile_logo.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
