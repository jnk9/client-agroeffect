class Report < ApplicationRecord
  belongs_to :sensor

  def self.daily(sector_id, params)
  search_params = params.to_h
    # sent_at: Date.today.at_beginning_of_week..Date.today
    data = []
    Monitoring.where(sector_id: sector_id).order(:sensor_id).pluck(:sensor_id).each do |m|
      s = Sensor.find(m)
      x = Monitoringsensor.reports(s.id, search_params)
      day = Hash[name: "Sensor #{s.id_sensor}", data: x]
      data << day
    end
    data
  end
end
