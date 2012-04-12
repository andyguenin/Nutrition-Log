class UsersController < ApplicationController
	include UserHelper

  before_filter :redirect_if_not_signed_in, :only => :profile

	def new
		@title = "Sign Up"
		@user = User.new
  end

  def update
  end

	def profile
			@title = current_user.name
			@user = current_user
			render 'show'
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
  	@user = User.find(params[:id])
	end
end
