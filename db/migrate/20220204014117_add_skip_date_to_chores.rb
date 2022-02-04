class AddSkipDateToChores < ActiveRecord::Migration[6.1]
  def change
    add_column :chores, :skip_date, :date
  end
end
