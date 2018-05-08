class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum:140 }
  belongs_to :user
  has_many :event_days 
end
