class AddColumnsToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :assignment_date, :string
    add_column :surveys, :week_category, :integer
  end
end
