class LogRecipe < ActiveRecord::Base
	
	belongs_to :user
	belongs_to :recipe
	has_many :logs

	
end
