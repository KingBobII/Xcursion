class Review < ApplicationRecord
  belongs_to :user
  belongs_to :excursion

  validates :content, presence: true
end
