class CreateChores < ActiveRecord::Migration[6.1]
  def change
    create_table :chores do |t|
      t.string :chore_name, :null => false 
      t.date :start_time
      t.references :user, foreign_key: true
      t.datetime :deleted_at


      t.timestamps
    end
  end
end
