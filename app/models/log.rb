class Log < ActiveRecord::Base
	belongs_to :user
	belongs_to :ingredient

	validates :servings,
		:presence => true

	validates :Date,
		:presence => true
end
