class Recipe < ActiveRecord::Base
	searchable do 
		text :name
	end
	belongs_to :creator, :class_name => "User"
	has_many :log_recipe

	has_many :recipe_ingredient_joins

	has_many :ingredients,
		:through => :recipe_ingredient_joins

	validates :name,
		:presence => true

	validates :serving_size,
		:presence => true

	def add_ingredient(i)
		self.ingredients << i
	end
end
