class SessionsController < ApplicationController
	
  def new
		@title = "Sign in"
  end

	def create
		user = User.authenticate(params[:sessions][:email], params[:sessions][:password])
		if user.nil?
			flash.now[:error] = "Invalid email and password combiation"
			@title = "Sign in"
			render 'new'	
		else
			sign_in user
			redirect_to user
		end
	end

	def destroy
		unless current_user.nil?
			sign_out
		end
		redirect_to :root
	end

end
