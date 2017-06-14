class Monitoring < ApplicationRecord
  belongs_to :sensor
  belongs_to :sector
end
