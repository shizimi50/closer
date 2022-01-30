class RemoveColumnsInChores < ActiveRecord::Migration[6.1]
  def change
    remove_column :chores, :start_time, :date
  end
end
