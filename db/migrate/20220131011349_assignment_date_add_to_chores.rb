class AssignmentDateAddToChores < ActiveRecord::Migration[6.1]
  def change
    add_column :chores, :start_time, :string
    add_column :chores, :assignment_date, :string
  end
end
