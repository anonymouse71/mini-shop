class Shipment < ActiveRecord::Base

  ####<$ Model Association $>####
  belongs_to :order

  ####<$ Validation $>####
  #validates_presence_of :order_id, :status
end
