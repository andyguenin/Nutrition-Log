class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.float :serving_size
      t.integer :creator_id

      t.timestamps
    end
  end
end
