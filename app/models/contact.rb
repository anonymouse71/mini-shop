class Contact < ActiveRecord::Base

  ####<$ Validation $>####
  validates_presence_of :full_name, :email, :phone_number, :message
end
