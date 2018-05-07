class CreateEventDays < ActiveRecord::Migration[5.1]
  def change
    create_table :event_days do |t|
      t.time :start_time
      t.time :end_time
      t.date :day

      t.timestamps
    end
  end
end
