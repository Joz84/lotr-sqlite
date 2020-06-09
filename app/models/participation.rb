class Participation < ApplicationRecord
  belongs_to :chapter
  belongs_to :character

  validates :chapter, uniqueness: { scope: :character }
end
