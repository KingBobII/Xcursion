class Excursion < ApplicationRecord
  belongs_to :user
  has_many :itineraries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :participants, through: :itineraries, dependent: :destroy

  validates :title, presence: true
end
