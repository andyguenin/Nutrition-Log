class UsersController < ApplicationController
	include UserHelper
	def new
		@title = "Sign Up"
		@user = User.new
  end

  def update
  end

	def profile
		unless signed_in?
			session[:redirection_url] = profile_url
			redirect_to signin_url
		else
				@title = current_user.name
				@user = current_user
				render 'show'
		end
	end

  def create
		@user = User.create(user_params)
		if @user.save
			sign_in @user
			redirect_to @user
		else
			p @user.errors
			flash.now[:error] = "Fix the errors before clicking Sign Up"
			@title = "Sign Up"
			render 'new'
		end
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  	@user = User.find_by_username(params[:id])
	end
end
