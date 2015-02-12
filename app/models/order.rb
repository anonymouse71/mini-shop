class Order < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :cart
  has_one :shipment
  has_one :billing_detail
  has_one :payment
  has_many :order_details
  belongs_to :user

  ####<$ Validation $>####
  validates_presence_of :cart_id, :order_date, :order_total

  STATUS = {
      :new => 'New',
      :pending => 'Pending',
      :shipped => 'Shipped',
      :canceled => 'Canceled',
      :confirmed => 'Confirmed'
  }

  ####<$ Scope List $>####
  scope :user_order_list, ->(user_id) { where('user_id =?', user_id)}

  def self.find_with_product(product)
    return [] unless product
    joins(:order_details).
        where(["order_details.product_id = ?", product.id]).
        order("orders.order_date DESC")
  end

  def order_total
    self.order_details.to_a.sum { |item| item.order_total_price }
  end

  end
