class CreateJobsituations < ActiveRecord::Migration[6.1]
  def change
    create_table :jobsituations do |t|
      t.string :jobsituation_name

      t.timestamps
    end
  end
end
