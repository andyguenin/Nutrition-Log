module ReceipesHelper
    def ingredient_params
		params[:recipe].slice(:name, :serving_size)
	end
end
