class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :excursion

  validates :user, presence: true
  validates :excursion, presence: true
end
