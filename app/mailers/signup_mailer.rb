class SignupMailer < ActionMailer::Base
  default :from => "no-reply@nlog.heroku.com"

	def welcome_email(user)
		@user = user
		@url = "http://nlog.heroku.com"
		mail(:to => user.email, :subject => "Welcome to the Nutrition Log website")
	end

end
