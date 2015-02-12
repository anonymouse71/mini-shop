class ProductPhoto < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :product

  mount_uploader :image, ProductPhotoUploader

  ####<$ Validation $>####
  validates_presence_of :product_id, :image
end
