class Appointment < ApplicationRecord
  belongs_to :event_day
  belongs_to :user
end
