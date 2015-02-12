class Customer < ActiveRecord::Base
  belongs_to :user

  ####<$ Validation $>####
  validates_presence_of :full_name, :email
end
