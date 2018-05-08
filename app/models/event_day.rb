class EventDay < ApplicationRecord
  validates :start_time, presence: true
  validates :end_time, presence: true
  belongs_to :event
  has_many :appointments
end
