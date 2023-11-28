class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  validates :rsvp, presence: true
end
