class CreateMChores < ActiveRecord::Migration[6.1]
  def change
    create_table :m_chores do |t|

      t.timestamps
    end
  end
end
