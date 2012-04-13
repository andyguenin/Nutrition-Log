class UsersController < ApplicationController
	include UserHelper

  before_filter :redirect_if_not_signed_in, :only => [:profile, :edit, :update, :destroy]

	def new
		@title = "Sign Up"
		@user = User.new
  end

  def update
		if current_user.update_attributes(user_params)
			redirect_to profile_path
		else
			flash.now[:error] = "Fix the errors before updating"
			@title = "Edit Profile"
			render 'edit'
		end
  end

	def profile
			@title = current_user.name
			@user = current_user
	end

  def create
		@user = User.create(user_params)
		if @user.save
			sign_in @user
			redirect_to @user
		else
			flash.now[:error] = "Fix the errors before clicking Sign Up"
			@title = "Sign Up"
			render 'new'
		end
  end

  def edit
  	@title = "Edit Profile"
	end

  def destroy
  end

  def index
  end

  def show
  	@user = User.find(params[:id])
	end
end
