class AddLogRecipesToLogs < ActiveRecord::Migration
  def change
	add_column :logs, :log_recipe_id, :integer
  end
end
