class Product < ActiveRecord::Base

  ####<$ Model Association $>####
  has_many :product_photos
  belongs_to :sub_category
  has_many :order_details
  has_many :home_sliders

  ####<$ Validation $>####
  validates_presence_of :name, :sub_category_id, :description, :price, :stock, :is_published, :product_code
  validates_uniqueness_of :name, :product_code

  ####<$ Scopes $>####

  scope :published_products, -> { where(is_published: true, is_deleted: false) }
end