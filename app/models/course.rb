class Course < ApplicationRecord
  belongs_to :user

  #title validation - needs to exist
  validates :title, presence: true
  validates :description, presence: true

  #cost validation - can't be a negative number
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}
end
