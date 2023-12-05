class Chatroom < ApplicationRecord
  belongs_to :itinerary
  has_many :messages
end
