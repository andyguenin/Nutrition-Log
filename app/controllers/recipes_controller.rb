class RecipesController < ApplicationController
	include RecipesHelper
	
	before_filter :redirect_if_not_signed_in, :except => :index
	
	def index
		@recent_recipes = Recipe.order("created_at DESC").limit(10)
		@title = "Recipes"
	end


	def new
		@title = "Create recipe"
		@recipe = Recipe.new
	end
	
     def show
		@recipe = Recipe.find(params[:id])
		@title = @recipe.name
		
      respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
          end
    end		

	def create
		@r = Recipe.create(recipe_params)
		if(@r.save)
			redirect_to  @r
		else
			flash.now[:error] = "Fix the errors before saving the ingredient"
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
