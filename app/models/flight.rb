class Flight < ApplicationRecord
  belongs_to :trip
  has_many :legs
  has_many :layovers
end
