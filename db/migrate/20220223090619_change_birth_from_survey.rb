class ChangeBirthFromSurvey < ActiveRecord::Migration[6.1]
  def change
    rename_column :surveys, :partner_jobsituation_id, :jobsituation_id

    change_column :surveys, :birth, :int
    change_column :surveys, :working_hours, :int
    change_column :surveys, :jobsituation_id, :int
  end
end
