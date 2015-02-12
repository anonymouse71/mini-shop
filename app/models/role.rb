class Role < ActiveRecord::Base

  ####<$ Model Association $>####
  has_and_belongs_to_many :users

  #attr_accessible :name

  # Role ID for authorization
  USER_ROLE   = {
      super_admin: 1,
      user: 2
  }
end
