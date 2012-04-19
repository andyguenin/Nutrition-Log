class Log < ActiveRecord::Base
	belongs_to :user
	belongs_to :ingredient
	belongs_to :log_recipe
	validates :servings,
		:presence => true

	validates :date,
		:presence => true
end
