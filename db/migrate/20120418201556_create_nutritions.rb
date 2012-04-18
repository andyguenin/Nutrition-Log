class CreateNutritions < ActiveRecord::Migration
  def change
    create_table :nutritions do |t|
      t.integer :ingredient_id
      t.integer :quantity
      t.string :name

      t.timestamps
    end
  end
end
