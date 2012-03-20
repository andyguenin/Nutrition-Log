require 'digest'
class User < ActiveRecord::Base
	attr_accessor :password
	attr_accessible :name, :email, :password, :password_confirmation

	validates :name, :presence => true
	validates :email, :presence => true,
		:format=> { :with => /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		:uniqueness => {:case_sensitive => false }
	validates :password, :presence => true,
		:confirmation => true,
		:length => {:minimum => 6}
	validates :password_confirmation, :presence => true



	before_save :encrypt_password


	def has_password?(sub_pwd)
		encrypted_password == encrypt(sub_pwd)
	end

	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end

	def self.authenticate_with_salt(id, cookie_salt)
		user.find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end

	private
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
