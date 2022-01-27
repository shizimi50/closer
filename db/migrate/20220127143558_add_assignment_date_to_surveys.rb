class AddAssignmentDateToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :assignment_date, :string
  end
end
