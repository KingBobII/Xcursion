class Itinerary < ApplicationRecord
  belongs_to :user
  belongs_to :excursion
  has_many :participants, dependent: :destroy

  validates :start_time, presence: true
end
