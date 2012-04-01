require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
	#
	
	valid_attr = {:name => "Andy Guenin", :email => "andyguenin@gmail.com"}
	test "should not create without all information" do
		user = User.new
		assert !user.save, "Saved without any information"
	end

	test "should not create with invalid email" do
		invalid_users = []
		invalid_emails = ["andygue@", "@c.com", "andyguenin.com"]
		invalid_emails.each do |email|
			invalid_users += [User.create(valid_attr.merge({:email => email})).save]
		end
		assert invalid_users.uniq.size == 1 and invalid_users[0] == false
	end
	test "should create a user with valid information" do
		user = User.create(valid_attr)
		assert user.save, "Valid information"
	end
end
