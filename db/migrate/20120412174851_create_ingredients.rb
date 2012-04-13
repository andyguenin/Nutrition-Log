class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :type_id
      t.integer :creator_id

      t.timestamps
    end
  end
end
