module RecipesHelper
    def recipe_params
		params[:recipe].slice(:name, :serving_size, :creator_id)
	end
end
