require 'digest'
class User < ActiveRecord::Base

# accessor methods
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation

# foreign key relations
	has_many :ingredients, 
		:foreign_key => "creator_id"
	
	has_many :recipes, 
		:foreign_key => "creator_id"
	
	has_many :logs
	
	has_many :recently_consumed_ingredients,
		:through => :logs,
		:class_name => "Ingredient",
		:conditions => ['logs.created_at > ?', 7.days.ago],
		:source => :ingredient,
		:foreign_key => "ingredient_id"
	
	has_many :consumed_ingredients, 
		:class_name => "Ingredient", 
		:through => :logs,
		:source => :ingredient

	has_many :log_recipes

	has_many :consumed_recipes, 
		:class_name => "Recipe",
		:through => :log_recipes,
		:source => :recipe
	

# validations
	validates :name, 
		:presence => true
	
	validates :email, 
		:presence => true,
		:format=> { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		:uniqueness => {:case_sensitive => false }

	validates :password, 
		:presence => true,
		:confirmation => true,
		:length => {:minimum => 6},
		:if => :save_password?

	validates :password_confirmation, 
		:presence => true,
		:if => :save_password?


	def consume_recipe(r)
		self.consumed_recipes << r
		r.ingredients.each do |i|
			self.logs.create(:ingredient_id => i, :servings => 1, :date => Time.now)
		end
	end

# callbacks
	before_save :encrypt_password

# methods
	def has_password?(sub_pwd)
		encrypted_password == encrypt(sub_pwd)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user = User.find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private

		def save_password?
			new_record? || !password.nil?	|| !password_confirmation.nil?
		end

		def encrypt_password
			self.salt = make_salt unless has_password?(password)
			self.encrypted_password = encrypt(password)
		end

		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end


end
