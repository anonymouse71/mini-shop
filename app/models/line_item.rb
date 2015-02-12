class LineItem < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :cart
  belongs_to :product

  ####<$ Validation $>####
  validates_presence_of :cart_id, :product_id, :quantity, :product_price

  def total_price
    product.price * quantity
  end
end
