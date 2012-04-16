module IngredientHelper
	def ingredient_params
		params[:ingredient].slice(:name, :type_id)
	end
end
