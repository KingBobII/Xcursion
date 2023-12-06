class Excursion < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    # attributes :title, :city, :description, :category
    # searchableAttributes ['title', 'city', 'unordered(description)', 'category']
  end

  acts_as_votable
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :itinerary_excursions, dependent: :destroy
  has_many :itineraries, through: :itinerary_excursions
  has_one_attached :image

  validates :title, :image, :city, :capacity, :length, :description, :category, presence: true
end
