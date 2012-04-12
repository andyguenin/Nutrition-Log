class Ingredient < ActiveRecord::Base
	belongs_to :creator, :class_name => "User"
  has_many :logs
	has_many :consumers, :class_name => "User", :through => :logs
end
