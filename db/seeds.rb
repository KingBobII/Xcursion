# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create Users
require 'json'
require 'open-uri'

puts "clearing database"
Review.destroy_all
Participant.destroy_all
Itinerary.destroy_all
Excursion.destroy_all
User.destroy_all

puts "creating users"

# Create Users
# Create Users
user1 = User.create!(
  username: 'john_doe',
  password: 'password',
  email: 'john@example.com',
  bio: 'Adventure seeker and nature lover.'
)

user2 = User.create!(
  username: 'jane_smith',
  password: 'password',
  email: 'jane@example.com',
  bio: 'Travel enthusiast and foodie.'
)

user3 = User.create!(
  username: 'alex_adventures',
  password: 'password',
  email: 'alex@example.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.'
)

puts "creating excursions"
# Create Excursions
# Create Excursions
# Create Excursions

# Excursion 1
excursion1 = Excursion.new(
  title: 'Hiking in the Rockies',
  city: 'Denver',
  capacity: 15,
  category: 'Hiking',
  length: 3,
  description: 'Explore the breathtaking beauty of the Rocky Mountains.',
  user: user1
)
excursion1_url = "https://source.unsplash.com/800x600/?excursion,#{excursion1.title}"
excursion1_file = URI.open(excursion1_url)
excursion1.image.attach(io: excursion1_file, filename: "#{excursion1.title}_image.png", content_type: 'image/png')
excursion1.save

# Excursion 2
excursion2 = Excursion.new(
  title: 'City Bike Tour',
  city: 'San Francisco',
  capacity: 10,
  category: 'Cycling',
  length: 2,
  description: 'Discover iconic landmarks on a bike through the city.',
  user: user2
)
excursion2_url = "https://source.unsplash.com/800x600/?excursion,#{excursion2.title}"
excursion2_file = URI.open(excursion2_url)
excursion2.image.attach(io: excursion2_file, filename: "#{excursion2.title}_image.png", content_type: 'image/png')
excursion2.save

# Continue the pattern for the remaining excursions (excursion3 to excursion15)
# ...

puts "#{Excursion.count} Excursions created"


puts "creating itineraries"
# Create Itineraries
# Create Itineraries
itinerary1 = Itinerary.create!(
  start_time: Time.now + 1.day,
  end_time: Time.now + 1.day + 3.hours,
  description: 'Morning hike with stunning views.',
  title: 'Mountain Hike',
  user: user1
)

itinerary2 = Itinerary.create!(
  start_time: Time.now + 2.days,
  end_time: Time.now + 2.days + 5.hours,
  description: 'Explore the city\'s historic neighborhoods.',
  title: 'City Exploration',
  user: user2
)

itinerary3 = Itinerary.create!(
  start_time: Time.now + 3.days,
  end_time: Time.now + 3.days + 4.hours,
  description: 'Visit local markets and try delicious street food.',
  title: 'Market Tour',
  user: user3
)

itinerary4 = Itinerary.create!(
  start_time: Time.now + 4.days,
  end_time: Time.now + 4.days + 6.hours,
  description: 'Relaxing day at the beach with water activities.',
  title: 'Beach Day',
  user: user1
)

puts "#{Itinerary.count} itineraries created"

puts "creating reviews"
# Create Reviews
review_data = [
  { content: 'Amazing experience! Highly recommend.', user_rating: 5 },
  { content: 'Good, but could be better.', user_rating: 3 }
  # Add more review data as needed
]

review_data.each do |review_attrs|
  review = Review.new(review_attrs)
  review.user = User.all.sample
  review.excursion = Excursion.all.sample
  review.save!
end

puts "#{Review.count} Reviews created"

puts "creating participants"
# Create Participants
participant_data = [
  { rsvp: 0, username: 'adventure_junkie', email: 'adventure@example.com', user: user1, itinerary: itinerary2 },
  { rsvp: 0, username: 'travel_bug', email: 'travel@example.com', user: user1, itinerary: itinerary1 }
  # Add more participant data as needed
]

Participant.create!(participant_data)

puts "#{Participant.count} Participants created"
