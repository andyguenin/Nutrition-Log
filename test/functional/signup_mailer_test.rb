require 'test_helper'

class SignupMailerTest < ActionMailer::TestCase
	def test_welcome_email
		user = User.first

		email = SignupMailer.welcome_email(user).deliver
		assert !ActionMailer::Base.deliveries.empty?

		assert_equal [user.email], email.to
		assert_equal "Welcome to the Nutrition Log website", email.subject
  end
end
