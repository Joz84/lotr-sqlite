class Chapter < ApplicationRecord
  has_many :participations
  belongs_to :book
end
