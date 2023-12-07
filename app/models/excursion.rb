class Excursion < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    # attributes :title, :city, :description, :category
    # searchableAttributes ['title', 'city', 'unordered(description)', 'category']
  end

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :itinerary_excursions, dependent: :destroy
  has_many :itineraries, through: :itinerary_excursions
  has_one_attached :image
  has_many :votes, dependent: :destroy

  validates :title, :city, :capacity, :duration, :description, :setting, :category, presence: true
end
