class OrderDetail < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :order
  belongs_to :product

  ####<$ Validation $>####
  validates_presence_of :order_id, :product_id, :quantity, :product_price

  def order_total_price
    product.price * quantity
  end
end
