class Itinerary < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :excursions, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :chat_rooms

  validates :start_time, :end_time, :description, :title, presence: true
end
