class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary

  enum rsvp: { undecided: 0,
               confirmed: 1,
               declined: 2 }
  validates :rsvp, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
