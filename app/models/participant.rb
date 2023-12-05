class Participant < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user
  
  enum rsvp: { undecided: 0,
               confirmed: 1,
               declined: 2 }
  validates :rsvp, presence: true
  belongs_to :user
  # validates :username, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true
end
