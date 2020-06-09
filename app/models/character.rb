class Character < ApplicationRecord
  has_many :participations
  has_many :quotes
end
