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
require 'faker'
puts "clearing databse"
Review.destroy_all
Participant.destroy_all
Itinerary.destroy_all
Excursion.destroy_all
User.destroy_all

puts "creating users"

5.times do
  User.create(
    username: Faker::Internet.username,
    password: 'password', # Replace with your desired default password
    email: Faker::Internet.email,
    bio: Faker::Lorem.paragraph
  )
end

puts "creating xcursions"
# Create Xcursions
5.times do
  Excursion.create(
    title: Faker::Lorem.words(number: 3).join(' '),
    image: 'https://media.timeout.com/images/105750719/750/422/image.jpg',
    city: Faker::Address.city,
    user: User.all.sample,
    capacity: Faker::Number.between(from: 5, to: 20),
    category: Faker::Lorem.word,
    length: Faker::Number.between(from: 1, to: 10),
    description: Faker::Lorem.paragraph
  )
end

puts "creating intineraries"
# Create Itineraries
5.times do
  Itinerary.create(
    start_time: Faker::Time.forward(days: 30, period: :morning),
    excursion_id: Excursion.all.sample.id,
    user: User.all.sample,
    description: Faker::Lorem.sentence,
    title: Faker::Lorem.words(number: 3).join(' ')
  )
end

puts "creating reviews"
# Create Reviews
5.times do
  Review.create(
    content: Faker::Lorem.paragraph,
    user: User.all.sample,
    excursion: Excursion.all.sample
  )
end

puts "creating participants"
# Create Participants
5.times do
  Participant.create(
    user: User.all.sample,
    itinerary: Itinerary.all.sample,
    rsvp: 0,
    username: Faker::Internet.username,
    email: Faker::Internet.email
  )
end
