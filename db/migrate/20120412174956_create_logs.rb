class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.integer :servings
      t.timestamp :date

      t.timestamps
    end
  end
end
