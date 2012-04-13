class Users::IngredientsController < ApplicationController

	before_filter :redirect_if_not_signed_in

	def index
		@created_ingredients = current_user.ingredients
		@consumed_ingredients = current_user.consumed_ingredients.where("logs created_at > ?", 7.days.ago).order("created_at DESC")
		@title = "My Ingredients"
  end

  def create
  end

  def update
  end

  def new
  end

  def edit
  end
end
