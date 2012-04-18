class AddLabelToNutrition < ActiveRecord::Migration
  def change
  	add_column :nutritions, :label, :string
	end
end
