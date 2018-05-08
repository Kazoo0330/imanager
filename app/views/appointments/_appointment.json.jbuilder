json.extract! appointment, :id, :comment, :user_id, :event_day_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
