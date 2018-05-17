class Event < ApplicationRecord
  validates :title, presence: true, length: { maximum:140 }
  belongs_to :user
#  belongs_to :appointment
end
