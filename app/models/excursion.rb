class Excursion < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :itinerary_excursions, dependent: :destroy
  has_many :itineraries, through: :itinerary_excursions
  # has_and_belongs_to_many :itineraries#, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :title, :image, :city, :capacity, :length, :description, :category, presence: true
end
