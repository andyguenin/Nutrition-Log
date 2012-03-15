class User < ActiveRecord::Base
	attr_accessible :name, :email

	validates :name, :presence => true
	validates :email, :presence => true,
		:format=> { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		:uniqueness => {:case_sensitive => false }
end
