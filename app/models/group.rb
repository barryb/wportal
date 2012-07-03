class Group < ActiveRecord::Base
  attr_accessible :name, :description, :protected
  
  validates :name, length: { minimum: 3, maximum: 50 }
  validates :description, length: { minimum: 6, maximum: 50 }
end
