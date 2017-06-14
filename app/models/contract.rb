class Contract < ApplicationRecord
  belongs_to :company
  belongs_to :user
  has_one :detail_contract

end
