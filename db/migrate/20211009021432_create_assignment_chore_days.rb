class CreateAssignmentChoreDays < ActiveRecord::Migration[6.1]
  def change
    create_table :assignment_chore_days do |t|
      t.string :working_hours, :null => false
      t.string :chore_days, :null => false

      t.timestamps
    end
  end
end
