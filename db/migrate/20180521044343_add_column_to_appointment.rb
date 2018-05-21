class AddColumnToAppointment < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :description, :text
  end
end
