class AddColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :appointment_id, :integer
  end
end
