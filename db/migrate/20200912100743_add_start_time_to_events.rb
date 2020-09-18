class AddStartTimeToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :StartTime, :time
    add_column :events, :EndTime, :time
  end
end
