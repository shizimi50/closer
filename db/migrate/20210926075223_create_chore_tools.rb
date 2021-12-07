class CreateChoreTools < ActiveRecord::Migration[6.1]
  def change
    create_table :chore_tools do |t|
      t.string :tool_name
      t.integer :take_time
      t.references :chore, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
