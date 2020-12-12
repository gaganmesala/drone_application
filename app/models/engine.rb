class Engine < ApplicationRecord
  belongs_to :drone, optional: true

  validates :name, :power_indicator, presence: true
end
