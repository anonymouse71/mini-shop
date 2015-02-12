class Category < ActiveRecord::Base

  ####<$ Association $>####
  has_many :sub_categories

  ####<$ Validation $>####
  validates_presence_of :name
end
