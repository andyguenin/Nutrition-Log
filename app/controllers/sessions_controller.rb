class SessionsController < ApplicationController
	
  def new
		@title = "Sign in"
		if session[:redirection_url]
			@redirection_url = session[:redirection_url]
			session.delete(:redirection_url)
		end
  end

	def create
		user = User.authenticate(params[:sessions][:email], params[:sessions][:password])
		@redirection_url = params[:sessions][:redirection_url]
		if user.nil?
			@email = params[:sessions][:email]
			flash.now[:error] = "Invalid email and password combiation"
			@title = "Sign in"
			render 'new'	
		else
			sign_in user
			redirect_to @redirection_url || profile_url
		end
	end

	def destroy
		unless current_user.nil?
			sign_out
		end
		redirect_to :root
	end

end
