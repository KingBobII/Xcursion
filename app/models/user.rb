class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :excursions, dependent: :destroy
  has_many :itineraries, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :username, presence: true, uniqueness: true
end
