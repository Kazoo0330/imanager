class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :event_day_id

      t.timestamps
    end
  end
end
