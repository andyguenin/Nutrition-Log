class AddIndeciesToAll < ActiveRecord::Migration
  def change
		add_index :ingredients, :creator_id
		add_index :log_recipes, :user_id
		add_index :log_recipes, :recipe_id
		add_index :logs, :user_id
		add_index :logs, :ingredient_id
		add_index :logs, :log_recipe_id
		add_index :nutritions, :ingredient_id

		add_index :recipe_ingredient_joins, :ingredient_id
		add_index :recipe_ingredient_joins, :recipe_id

		add_index :recipes, :name
		add_index :recipes, :creator_id
	
	end
end
