class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.string :chore_name, :null => false 
      t.date :start_time
      t.integer  :user_id
      t.datetime :deleted_at


      t.timestamps
    end
  end
end
