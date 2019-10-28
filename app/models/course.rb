class Course < ApplicationRecord
  belongs_to :user
  has_many :sections
  has_many :enrollments

  # title validation - needs to exist
  validates :title, presence: true
  validates :description, presence: true

  # cost validation - can't be a negative number
  validates :cost, presence: true, numericality: {greater_than_or_equal_to: 0}

  def free?
    cost.zero?
  end

  def premium?
    ! free?
  end

  mount_uploader :image, ImageUploader
end
