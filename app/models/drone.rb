class Drone < ApplicationRecord
  has_many :engines, dependent: :destroy
  has_one :gyroscope, dependent: :destroy
  has_one :orientation_sensor, dependent: :destroy

  validates :name, :colour, presence: true
end
