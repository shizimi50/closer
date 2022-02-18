class ChangeDataColumnsToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column :surveys, :partner_jobsituation_id, :int
    change_column :surveys, :children, :int
    change_column :surveys, :youngest_child_age, :int
    change_column :surveys, :has_child_kindergarten, :boolean
  end
end
