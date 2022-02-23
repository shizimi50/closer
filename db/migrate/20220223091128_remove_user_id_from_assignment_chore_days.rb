class RemoveUserIdFromAssignmentChoreDays < ActiveRecord::Migration[6.1]
  def up
    remove_column :assignment_chore_days, :user_id
  end

  def down
    add_column :assignment_chore_days, :user_id, :integer
  end
end
