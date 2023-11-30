class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :itinerary_excursions, dependent: :destroy
  has_many :excursions, through: :itinerary_excursions
  # has_and_belongs_to_many :excursions#, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :chat_rooms

  validates :start_time, :end_time, :description, :title, presence: true
  validates :title, uniqueness: true
end
