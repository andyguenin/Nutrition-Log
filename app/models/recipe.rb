class Recipe < ActiveRecord::Base
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

	def add_ingredients(i)
		i.each do |ing|
			add_ingredient(ing)
		end
	end

	def self.search(search)
      if search
        find(:all, :conditions => ['name LIKE ?', "%#{search}%"], :order => "name ASC")
      else
        find(:all)
      end
    end


end
