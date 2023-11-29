class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  enum rsvp: { pending: 0,
               confirmed: 1,
               declined: 2 }
  validates :rsvp, presence: true
end
