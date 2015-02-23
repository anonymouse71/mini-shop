class Product < ActiveRecord::Base

  ####<$ Model Association $>####
  has_many :product_photos
  belongs_to :sub_category
  has_many :order_details
  has_many :home_sliders
  has_many :property_sets, :dependent => :destroy

  accepts_nested_attributes_for :property_sets, :allow_destroy => true

  ####<$ Validation $>####
  validates_presence_of :name, :sub_category_id, :description, :price, :stock, :is_published, :product_code
  validates_uniqueness_of :name, :product_code

  ####<$ Scopes $>####

  scope :published_products, -> { where(is_published: true, is_deleted: false) }

  def create_property_sets(product_variants)
    Product.transaction do
      self.property_sets.destroy_all
      product_variants.each do |set|
        if set[1]["_destroy"] == "0" || set[1]["_destroy"].nil?
          self.property_sets.create(:name => set[1]["name"], :properties => set[1]["properties"])
        end
      end
    end
  end
end