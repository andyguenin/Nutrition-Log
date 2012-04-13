class CreateLogRecipes < ActiveRecord::Migration
  def change
    create_table :log_recipes do |t|
      t.integer :user_id
      t.integer :recipe_id
      t.datetime :date
      t.integer :servings

      t.timestamps
    end
  end
end
