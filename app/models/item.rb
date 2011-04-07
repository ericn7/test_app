class Item < ActiveRecord::Base
  #acts_as_list
  attr_accessible :title, :position

  validates :title, :presence => true
end
