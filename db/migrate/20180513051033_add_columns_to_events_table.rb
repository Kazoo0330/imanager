class AddColumnsToEventsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :disp_flg, :boolean
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
    add_column :events, :allDay, :boolean
  end
end
