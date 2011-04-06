class Item < ActiveRecord::Base
  attr_accessible :title, :sort

  validates :title, :presence => true
end
