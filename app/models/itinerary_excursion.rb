class ItineraryExcursion < ApplicationRecord
  belongs_to :intinerary
  belongs_to :excursion

  validates :itinerary, presence: true
  validates :excursion, presence: true
end
