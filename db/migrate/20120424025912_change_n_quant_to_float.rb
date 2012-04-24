class ChangeNQuantToFloat < ActiveRecord::Migration
  def change
  	remove_column :nutritions, :quantity

		add_column :nutritions, :quantity, :float
	end
end
