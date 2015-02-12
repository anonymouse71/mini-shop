class Payment < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :order

  ####<$ Validation $>####
  validates_presence_of :payment_type

  PAYMENT_TYPE = {
      :bikash => 'Bikash',
      :cash_on_delivery => 'Cash on Delivery'
  }
end
