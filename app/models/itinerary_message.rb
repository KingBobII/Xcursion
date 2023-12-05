class ItineraryMessage < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  def sender?(a_user)
    user.id == a_user.id
  end
end
