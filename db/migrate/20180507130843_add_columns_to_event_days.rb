class AddColumnsToEventDays < ActiveRecord::Migration[5.1]
  def change
    add_column :event_days, :event_id, :integer
  end
end
