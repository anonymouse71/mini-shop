class Page < ActiveRecord::Base

  ####<$ Validation $>####
  validates_presence_of :title, :permalink, :content, :is_published
end
