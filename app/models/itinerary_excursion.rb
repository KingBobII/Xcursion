class ItineraryExcursion < ApplicationRecord
  belongs_to :itinerary
  belongs_to :excursion

  validates :itinerary, presence: true
  validates :excursion, presence: true
end
