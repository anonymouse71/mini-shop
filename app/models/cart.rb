class Cart < ActiveRecord::Base

  ####<$ Model Association $>####
  has_many :line_items
  has_one :order

  ####<$ Validation $>####
  # validates_presence_of :shipping_cost
  #
  def add_product(product, quantity = 1)
    current_item = self.line_items.find_by_product_id(product.id)
    if current_item
      current_item.quantity += 1
      current_item.save
    else
      current_item = self.line_items.build(product_id: product.id, cart_id: self.id, quantity: quantity, product_price: product.price)
    end
    current_item
  end

  def cart_items
    line_items = self.line_items

    items = []
    line_items.each do |item|
      product = item.product
      item_j = {
          id: item.id,
          image: product.product_photos.first.image_url(:thumb_medium),
          name: product.name,
          price: product.price,
          quantity: item.quantity
      }

      items << item_j
    end

    items
  end

  def cart_total
    self.line_items.to_a.sum { |item| item.total_price }
  end

end
