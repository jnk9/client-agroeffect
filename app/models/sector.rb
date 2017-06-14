class Sector < ApplicationRecord
  has_many :monitorings
  belongs_to :plant
  has_one :detail_contract
  has_one :restriction
end
