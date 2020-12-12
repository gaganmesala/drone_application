class Gyroscope < ApplicationRecord
  belongs_to :drone, optional: true

  validates :name, presence: true
end
