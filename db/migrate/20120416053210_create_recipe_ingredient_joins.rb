class CreateRecipeIngredientJoins < ActiveRecord::Migration
  def change
    create_table :recipe_ingredient_joins do |t|
      t.integer :ingredient_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
