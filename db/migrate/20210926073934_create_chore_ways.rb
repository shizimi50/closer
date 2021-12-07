class CreateChoreWays < ActiveRecord::Migration[6.1]
  def change
    create_table :chore_ways do |t|
      t.string :step_name 
      t.text :method
      t.references :chore, null: false
      t.datetime :deleted_at


      t.timestamps
    end
  end
end
