class Company < ApplicationRecord
  has_one :user
  has_many :accounts
end
