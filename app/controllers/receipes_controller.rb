class ReceipesController < ApplicationController
	
	before_filter :redirect_if_not_signed_in, :except => :index
	
	def index
		@recent_recipes = Recipe.order("created_at DESC").limit(10)
		@title = "Recipes"
	end


	def new
		@title = "Create recipe"
	end

	def create
		@r = Recipe.create(params[:recipe])
		if(@r.save)
			redirect_to @r
		else
			flash.now[:error] = "You had an error creating your recipe"
			@title = "Crate recipe"
			render 'new'
		end
	end

	def add_ingredient
		@recipe = params[:recipe_id]
		@ing = Ingredient.find_by_name(params[:ingredient_name])
		unless @ing.nil?
			@recipe.ingredients << @ing
			true
		else
			false
		end
	end
			
end
