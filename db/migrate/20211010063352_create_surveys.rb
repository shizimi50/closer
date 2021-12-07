class CreateSurveys < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.string :sex
      t.string :birth
      t.string :working_hours
      t.string :holiday
      t.string :partner_jobsituation
      t.string :children
      t.string :youngest_child_age
      t.string :kindergarten
      t.integer  :user_id
      
      t.timestamps
    end
  end
end
