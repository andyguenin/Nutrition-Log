class RecipesController < ApplicationController
	
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

	def consume
		@r = Recipe.find(params[:id])
		current_user.consume_recipe(@r)
		redirect_to profile_path
	end

	def create
		@r = Recipe.create(params[:recipe])
		if(@r.save)
			redirect_to @r
		else
			flash.now[:error] = "You had an error creating your recipe"
			@title = "Create recipe"
			@recipe = @r
			render 'new'
		end
	end

	def search
		render :partial => "search_results", :locals => {:recipes => Recipe.search(params[:q])}
	end


	def edit
		@recipe = Recipe.find(params[:id])
		@title = "Edit #{@recipe.name}"
	end


	def addingredient
		@recipe = Recipe.find(params[:id])
		@ing = Ingredient.find(params[:ingredient_id])
		unless @ing.nil?
			@recipe.ingredients << @ing	
		end
		redirect_to edit_recipe_path(@recipe)
	end

end
