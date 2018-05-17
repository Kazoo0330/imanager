class RemoveColumnFromAppointments < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :event_day_id, :integer
	remove_column :appointments, :comment, :text
  end
end
