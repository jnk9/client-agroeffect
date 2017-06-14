class Sensor < ApplicationRecord
  has_one :monitoring
  has_many :monitoring_sensors

  def self.available
    where.not(id: Sensor.joins(:monitoring).pluck(:id))
  end
end
