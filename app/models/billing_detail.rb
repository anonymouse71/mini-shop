class BillingDetail < ActiveRecord::Base
  ####<$ Model Association $>####
  belongs_to :order
end
