class CreateWeekDays < ActiveRecord::Migration[6.1]
  def change
    create_table :week_days do |t|
      t.string :weekday_name 
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
