class StudentGroup < ApplicationRecord
#  validates :year, presence: true
#  validates :month, presence: true 
  validates :course_name, presence: true, length: { maximum: 60 }
  has_many :users
  belongs_to :user
end
