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
Chatroom.destroy_all
Message.destroy_all

puts "creating users"

# Create Users
# Create Users
user1 = User.create!(
  username: 'Jack',
  password: 'password',
  email: 'jack@example.com',
  bio: 'Adventure seeker and nature lover.'
)

user2 = User.create!(
  username: 'Tony',
  password: 'password',
  email: 'tony@example.com',
  bio: 'Travel enthusiast and foodie.'
)

user3 = User.create!(
  username: 'April',
  password: 'password',
  email: 'april@example.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.'
)

user4 = User.create!(
  username: 'Miles',
  password: 'password',
  email: 'miles@example.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.'
)

user5 = User.create!(
  username: 'James',
  password: 'password',
  email: 'james@example.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.'
)

puts "creating excursions"
# Create Excursions

# Excursion 1
# Excursion 1
# excursion1 = Excursion.new(
#   title: 'Table Mountain Hike',
#   city: 'Cape Town',
#   capacity: 20,
#   category: 'Hiking',
#   setting: "Friends",
#   length: 4,
#   description: 'Ascend to the summit of Table Mountain and enjoy panoramic views of the city and coastline.',
#   user: User.all.sample
# )
# excursion1_url = "https://source.unsplash.com/800x600/?excursion,#{excursion1.title.parameterize}"
# excursion1_file = URI.open(excursion1_url)
# excursion1.image.attach(io: excursion1_file, filename: "#{excursion1.title.parameterize}_image.png", content_type: 'image/png')
# excursion1.save

# # Excursion 2
# excursion2 = Excursion.new(
#   title: 'Cape Peninsula Coastal Drive',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Scenic Drive',
#   setting: "Family",
#   length: 5,
#   description: 'Explore the stunning coastal landscapes along the Cape Peninsula.',
#   user: User.all.sample
# )
# excursion2_url = "https://source.unsplash.com/800x600/?excursion,#{excursion2.title.parameterize}"
# excursion2_file = URI.open(excursion2_url)
# excursion2.image.attach(io: excursion2_file, filename: "#{excursion2.title.parameterize}_image.png", content_type: 'image/png')
# excursion2.save

# # Repeat the pattern for other excursions as needed, using User.all.sample directly.

# # Excursion 3

# excursion3 = Excursion.new(
#   title: 'Winelands Vineyard Tour',
#   city: 'Cape Town',
#   capacity: 12,
#   category: 'Wine Tasting',
#   setting: "Business",
#   length: 3,
#   description: 'Visit picturesque vineyards in the Cape Winelands and indulge in wine tastings.',
#   user: User.all.sample
# )
# excursion3_url = "https://source.unsplash.com/800x600/?excursion,#{excursion3.title.parameterize}"
# excursion3_file = URI.open(excursion3_url)
# excursion3.image.attach(io: excursion3_file, filename: "#{excursion3.title.parameterize}_image.png", content_type: 'image/png')
# excursion3.save

# # Excursion 4
# excursion4 = Excursion.new(
#   title: 'Cape Point Day Trip',
#   city: 'Cape Town',
#   capacity: 18,
#   category: 'Sightseeing',
#   setting: "Family",
#   length: 6,
#   description: 'Explore the iconic Cape Point and the Cape of Good Hope.',
#   user: User.all.sample
# )
# excursion4_url = "https://source.unsplash.com/800x600/?excursion,#{excursion4.title.parameterize}"
# excursion4_file = URI.open(excursion4_url)
# excursion4.image.attach(io: excursion4_file, filename: "#{excursion4.title.parameterize}_image.png", content_type: 'image/png')
# excursion4.save

# # Excursion 5
# excursion5 = Excursion.new(
#   title: 'Boulders Beach Penguin Encounter',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Wildlife',
#   setting: "Romantic",
#   length: 2,
#   description: 'Get up close with adorable African penguins at Boulders Beach.',
#   user: User.all.sample
# )
# excursion5_url = "https://source.unsplash.com/800x600/?excursion,#{excursion5.title.parameterize}"
# excursion5_file = URI.open(excursion5_url)
# excursion5.image.attach(io: excursion5_file, filename: "#{excursion5.title.parameterize}_image.png", content_type: 'image/png')
# excursion5.save

# # Continue the pattern for other excursions as needed, using User.all.sample directly.

# # Excursion 6
# excursion6 = Excursion.new(
#   title: 'Chapman\'s Peak Drive Sunset',
#   city: 'Cape Town',
#   capacity: 12,
#   category: 'Scenic Drive',
#   setting: "Family",
#   length: 3,
#   description: 'Experience a breathtaking sunset drive along Chapman\'s Peak Drive.',
#   user: User.all.sample
# )
# excursion6_url = "https://source.unsplash.com/800x600/?excursion,#{excursion6.title.parameterize}"
# excursion6_file = URI.open(excursion6_url)
# excursion6.image.attach(io: excursion6_file, filename: "#{excursion6.title.parameterize}_image.png", content_type: 'image/png')
# excursion6.save

# # Excursion 7
# excursion7 = Excursion.new(
#   title: 'District Six Walking Tour',
#   city: 'Cape Town',
#   capacity: 10,
#   category: 'Historical',
#   setting: "Business",
#   length: 2,
#   description: 'Explore the history of District Six on a guided walking tour.',
#   user: User.all.sample
# )
# excursion7_url = "https://source.unsplash.com/800x600/?excursion,#{excursion7.title.parameterize}"
# excursion7_file = URI.open(excursion7_url)
# excursion7.image.attach(io: excursion7_file, filename: "#{excursion7.title.parameterize}_image.png", content_type: 'image/png')
# excursion7.save

# # Continue the pattern for other excursions as needed, using User.all.sample directly.

# # Excursion 8
# excursion8 = Excursion.new(
#   title: 'Signal Hill Sunset',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Scenic View',
#   setting: "Romantic",
#   length: 1,
#   description: 'Enjoy a breathtaking sunset from Signal Hill with panoramic views of the city.',
#   user: User.all.sample
# )
# excursion8_url = "https://source.unsplash.com/800x600/?excursion,#{excursion8.title.parameterize}"
# excursion8_file = URI.open(excursion8_url)
# excursion8.image.attach(io: excursion8_file, filename: "#{excursion8.title.parameterize}_image.png", content_type: 'image/png')
# excursion8.save

# # Excursion 9
# excursion9 = Excursion.new(
#   title: 'Cape Town Street Art Exploration',
#   city: 'Cape Town',
#   capacity: 12,
#   category: 'Art',
#   setting: "Business",
#   length: 2,
#   description: 'Discover vibrant street art in the artistic neighborhoods of Cape Town.',
#   user: User.all.sample
# )
# excursion9_url = "https://source.unsplash.com/800x600/?excursion,#{excursion9.title.parameterize}"
# excursion9_file = URI.open(excursion9_url)
# excursion9.image.attach(io: excursion9_file, filename: "#{excursion9.title.parameterize}_image.png", content_type: 'image/png')
# excursion9.save

# # Excursion 10
# excursion10 = Excursion.new(
#   title: 'Bo-Kaap Culinary Tour',
#   city: 'Cape Town',
#   capacity: 10,
#   category: 'Culinary',
#   setting: "Romantic",
#   length: 3,
#   description: 'Indulge in a culinary adventure through the flavors of Bo-Kaap.',
#   user: User.all.sample
# )
# excursion10_url = "https://source.unsplash.com/800x600/?excursion,#{excursion10.title.parameterize}"
# excursion10_file = URI.open(excursion10_url)
# excursion10.image.attach(io: excursion10_file, filename: "#{excursion10.title.parameterize}_image.png", content_type: 'image/png')
# excursion10.save

# # Continue the pattern for other excursions as needed, using User.all.sample directly.

# # Excursion 11
# excursion11 = Excursion.new(
#   title: 'Lion\'s Head Full Moon Hike',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Hiking',
#   setting: "Friends",
#   length: 2,
#   description: 'Embark on a thrilling full moon hike to the summit of Lion\'s Head.',
#   user: User.all.sample
# )
# excursion11_url = "https://source.unsplash.com/800x600/?excursion,#{excursion11.title.parameterize}"
# excursion11_file = URI.open(excursion11_url)
# excursion11.image.attach(io: excursion11_file, filename: "#{excursion11.title.parameterize}_image.png", content_type: 'image/png')
# excursion11.save

# # Excursion 12
# excursion12 = Excursion.new(
#   title: 'Cape Winelands Hot Air Balloon Ride',
#   city: 'Cape Town',
#   capacity: 8,
#   category: 'Adventure',
#   setting: "Romantic",
#   length: 4,
#   description: 'Soar above the Cape Winelands in a hot air balloon for a unique perspective.',
#   user: User.all.sample
# )
# excursion12_url = "https://source.unsplash.com/800x600/?excursion,#{excursion12.title.parameterize}"
# excursion12_file = URI.open(excursion12_url)
# excursion12.image.attach(io: excursion12_file, filename: "#{excursion12.title.parameterize}_image.png", content_type: 'image/png')
# excursion12.save

# # Excursion 13
# excursion13 = Excursion.new(
#   title: 'Groot Constantia Wine Tasting',
#   city: 'Cape Town',
#   capacity: 10,
#   category: 'Wine Tasting',
#   setting: "Family",
#   length: 2,
#   description: 'Experience the rich history and exquisite wines of Groot Constantia.',
#   user: User.all.sample
# )
# excursion13_url = "https://source.unsplash.com/800x600/?excursion,#{excursion13.title.parameterize}"
# excursion13_file = URI.open(excursion13_url)
# excursion13.image.attach(io: excursion13_file, filename: "#{excursion13.title.parameterize}_image.png", content_type: 'image/png')
# excursion13.save

# # Excursion 14
# excursion14 = Excursion.new(
#   title: 'Noordhoek Beach Horseback Riding',
#   city: 'Cape Town',
#   capacity: 8,
#   category: 'Adventure',
#   setting: "Friends",
#   length: 3,
#   description: 'Explore the scenic Noordhoek Beach on horseback for a unique adventure.',
#   user: User.all.sample
# )
# excursion14_url = "https://source.unsplash.com/800x600/?excursion,#{excursion14.title.parameterize}"
# excursion14_file = URI.open(excursion14_url)
# excursion14.image.attach(io: excursion14_file, filename: "#{excursion14.title.parameterize}_image.png", content_type: 'image/png')
# excursion14.save

# # Excursion 15
# excursion15 = Excursion.new(
#   title: 'Robben Island Historical Tour',
#   city: 'Cape Town',
#   capacity: 20,
#   category: 'Historical',
#   setting: "Family",
#   length: 4,
#   description: 'Visit Robben Island and learn about its historical significance, including the former prison.',
#   user: User.all.sample
# )
# excursion15_url = "https://source.unsplash.com/800x600/?excursion,#{excursion15.title.parameterize}"
# excursion15_file = URI.open(excursion15_url)
# excursion15.image.attach(io: excursion15_file, filename: "#{excursion15.title.parameterize}_image.png", content_type: 'image/png')
# excursion15.save

# # Excursion 16
# excursion16 = Excursion.new(
#   title: 'Cape Town Helicopter Tour',
#   city: 'Cape Town',
#   capacity: 4,
#   category: 'Aerial Tour',
#   setting: "Business",
#   length: 1,
#   description: 'Soar above Cape Town and enjoy breathtaking aerial views on a helicopter tour.',
#   user: User.all.sample
# )
# excursion16_url = "https://source.unsplash.com/800x600/?excursion,#{excursion16.title.parameterize}"
# excursion16_file = URI.open(excursion16_url)
# excursion16.image.attach(io: excursion16_file, filename: "#{excursion16.title.parameterize}_image.png", content_type: 'image/png')
# excursion16.save

# # Excursion 17
# excursion17 = Excursion.new(
#   title: 'Hermanus Whale Watching Cruise',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Wildlife',
#   setting: "Family",
#   length: 5,
#   description: 'Embark on a whale-watching cruise in Hermanus and witness these magnificent creatures.',
#   user: User.all.sample
# )
# excursion17_url = "https://source.unsplash.com/800x600/?excursion,#{excursion17.title.parameterize}"
# excursion17_file = URI.open(excursion17_url)
# excursion17.image.attach(io: excursion17_file, filename: "#{excursion17.title.parameterize}_image.png", content_type: 'image/png')
# excursion17.save

# # Excursion 18
# excursion18 = Excursion.new(
#   title: 'Kloofing Adventure in Jonkershoek Nature Reserve',
#   city: 'Cape Town',
#   capacity: 6,
#   category: 'Adventure',
#   setting: "Friends",
#   length: 6,
#   description: 'Experience an adrenaline-pumping kloofing adventure in Jonkershoek Nature Reserve.',
#   user: User.all.sample
# )
# excursion18_url = "https://source.unsplash.com/800x600/?excursion,#{excursion18.title.parameterize}"
# excursion18_file = URI.open(excursion18_url)
# excursion18.image.attach(io: excursion18_file, filename: "#{excursion18.title.parameterize}_image.png", content_type: 'image/png')
# excursion18.save

# # Excursion 19
# excursion19 = Excursion.new(
#   title: 'Spier Wine Farm Segway Tour',
#   city: 'Cape Town',
#   capacity: 10,
#   category: 'Wine Tasting',
#   setting: "Romantic",
#   length: 2,
#   description: 'Explore the Spier Wine Farm on a Segway, combining adventure with wine tasting.',
#   user: User.all.sample
# )
# excursion19_url = "https://source.unsplash.com/800x600/?excursion,#{excursion19.title.parameterize}"
# excursion19_file = URI.open(excursion19_url)
# excursion19.image.attach(io: excursion19_file, filename: "#{excursion19.title.parameterize}_image.png", content_type: 'image/png')
# excursion19.save

# # Excursion 20
# excursion20 = Excursion.new(
#   title: 'Muizenberg Surfing Lesson',
#   city: 'Cape Town',
#   capacity: 8,
#   category: 'Water Sports',
#   setting: "Friends",
#   length: 3,
#   description: 'Learn to surf on the iconic waves of Muizenberg Beach with a professional instructor.',
#   user: User.all.sample
# )
# excursion20_url = "https://source.unsplash.com/800x600/?excursion,#{excursion20.title.parameterize}"
# excursion20_file = URI.open(excursion20_url)
# excursion20.image.attach(io: excursion20_file, filename: "#{excursion20.title.parameterize}_image.png", content_type: 'image/png')
# excursion20.save

# # Excursion 21
# excursion21 = Excursion.new(
#   title: 'Tygerberg Nature Reserve Trail',
#   city: 'Cape Town',
#   capacity: 12,
#   category: 'Nature Walk',
#   setting: "Family",
#   length: 4,
#   description: 'Hike through the scenic trails of Tygerberg Nature Reserve and enjoy nature.',
#   user: User.all.sample
# )
# excursion21_url = "https://source.unsplash.com/800x600/?excursion,#{excursion21.title.parameterize}"
# excursion21_file = URI.open(excursion21_url)
# excursion21.image.attach(io: excursion21_file, filename: "#{excursion21.title.parameterize}_image.png", content_type: 'image/png')
# excursion21.save

# # Excursion 22
# excursion22 = Excursion.new(
#   title: 'Cape Town Sunset Catamaran Cruise',
#   city: 'Cape Town',
#   capacity: 18,
#   category: 'Boat Tour',
#   setting: "Romantic",
#   length: 2,
#   description: 'Sail along the coast of Cape Town and witness a spectacular sunset on a catamaran cruise.',
#   user: User.all.sample
# )
# excursion22_url = "https://source.unsplash.com/800x600/?excursion,#{excursion22.title.parameterize}"
# excursion22_file = URI.open(excursion22_url)
# excursion22.image.attach(io: excursion22_file, filename: "#{excursion22.title.parameterize}_image.png", content_type: 'image/png')
# excursion22.save

# excursion23 = Excursion.new(
#   title: 'Kalk Bay Coastal Walk',
#   city: 'Cape Town',
#   capacity: 12,
#   category: 'Nature Walk',
#   setting: "Romatic",
#   length: 3,
#   description: 'Enjoy a scenic coastal walk from Kalk Bay to St. James with stunning ocean views.',
#   user: User.all.sample
# )
# excursion23_url = "https://source.unsplash.com/800x600/?excursion,#{excursion23.title.parameterize}"
# excursion23_file = URI.open(excursion23_url)
# excursion23.image.attach(io: excursion23_file, filename: "#{excursion23.title.parameterize}_image.png", content_type: 'image/png')
# excursion23.save

# # Excursion 24
# excursion24 = Excursion.new(
#   title: 'Two Oceans Aquarium Exploration',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Aquarium',
#   setting: "Family",
#   length: 2,
#   description: 'Discover marine life from the Atlantic and Indian Oceans at the Two Oceans Aquarium.',
#   user: User.all.sample
# )
# excursion24_url = "https://source.unsplash.com/800x600/?excursion,#{excursion24.title.parameterize}"
# excursion24_file = URI.open(excursion24_url)
# excursion24.image.attach(io: excursion24_file, filename: "#{excursion24.title.parameterize}_image.png", content_type: 'image/png')
# excursion24.save

# # Excursion 25
# excursion25 = Excursion.new(
#   title: 'Sunset Cruise in Table Bay',
#   city: 'Cape Town',
#   capacity: 20,
#   category: 'Boat Tour',
#   setting: "Friends",
#   length: 2,
#   description: 'Experience a magical sunset cruise in Table Bay with breathtaking views of the coastline.',
#   user: User.all.sample
# )
# excursion25_url = "https://source.unsplash.com/800x600/?excursion,#{excursion25.title.parameterize}"
# excursion25_file = URI.open(excursion25_url)
# excursion25.image.attach(io: excursion25_file, filename: "#{excursion25.title.parameterize}_image.png", content_type: 'image/png')
# excursion25.save

# # Excursion 26
# excursion26 = Excursion.new(
#   title: 'Rhodes Memorial Photography Tour',
#   city: 'Cape Town',
#   capacity: 10,
#   category: 'Photography',
#   setting: "Friends",
#   length: 3,
#   description: 'Capture the beauty of Cape Town from Rhodes Memorial with a guided photography tour.',
#   user: User.all.sample
# )
# excursion26_url = "https://source.unsplash.com/800x600/?excursion,#{excursion26.title.parameterize}"
# excursion26_file = URI.open(excursion26_url)
# excursion26.image.attach(io: excursion26_file, filename: "#{excursion26.title.parameterize}_image.png", content_type: 'image/png')
# excursion26.save

# # Excursion 27
# excursion27 = Excursion.new(
#   title: 'Cape Town Comedy Club Night',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Entertainment',
#   setting: "Friends",
#   length: 4,
#   description: 'Laugh the night away at the Cape Town Comedy Club with top local and international comedians.',
#   user: User.all.sample
# )
# excursion27_url = "https://source.unsplash.com/800x600/?excursion,#{excursion27.title.parameterize}"
# excursion27_file = URI.open(excursion27_url)
# excursion27.image.attach(io: excursion27_file, filename: "#{excursion27.title.parameterize}_image.png", content_type: 'image/png')
# excursion27.save

# # Excursion 28
# excursion28 = Excursion.new(
#   title: 'Kalk Bay Harbour Exploration',
#   city: 'Cape Town',
#   capacity: 15,
#   category: 'Harbour Visit',
#   setting: "Family",
#   length: 3,
#   description: 'Discover the charm of Kalk Bay Fishing Harbour and its vibrant atmosphere.',
#   user: User.all.sample
# )
# excursion28_url = "https://source.unsplash.com/800x600/?excursion,#{excursion28.title.parameterize}"
# excursion28_file = URI.open(excursion28_url)
# excursion28.image.attach(io: excursion28_file, filename: "#{excursion28.title.parameterize}_image.png", content_type: 'image/png')
# excursion28.save

# excursion29 = Excursion.new(
#   title: 'Kirstenbosch Botanical Gardens',
#   city: 'Cape Town',
#   capacity: 18,
#   category: 'Botanical Gardens',
#   setting: "Family",
#   length: 2,
#   description: 'Stroll through the beautiful Kirstenbosch National Botanical Gardens.',
#   user: User.all.sample
# )
# excursion29_url = "https://source.unsplash.com/800x600/?excursion,#{excursion29.title.parameterize}"
# excursion29_file = URI.open(excursion29_url)
# excursion29.image.attach(io: excursion29_file, filename: "#{excursion29.title.parameterize}_image.png", content_type: 'image/png')
# excursion29.save
require 'open-uri'

# Define a method to create excursions
def create_excursion(title, city, capacity, category, setting, duration, description, user)
  excursion = Excursion.new(
    title: title,
    city: city,
    capacity: capacity,
    category: category,
    setting: setting,
    duration: duration,
    description: description,
    user: user
    # Add other attributes like average_rating or review if necessary
  )

  excursion_url = "https://source.unsplash.com/800x600/?excursion,#{excursion.title.parameterize}"
  excursion_file = URI.open(excursion_url)
  excursion.image.attach(io: excursion_file, filename: "#{excursion.title.parameterize}_image.png", content_type: 'image/png')
  excursion.save
end

# Use the method to create various excursions
create_excursion(
  'Table Mountain Hike',
  'Cape Town',
  20,
  'Hiking',
  'Friends',
  4,
  'Ascend to the summit of Table Mountain and enjoy panoramic views of the city and coastline.',
  User.all.sample
)

create_excursion(
  'Cape Peninsula Coastal Drive',
  'Cape Town',
  15,
  'Scenic Drive',
  'Family',
  5,
  'Explore the stunning coastal landscapes along the Cape Peninsula.',
  User.all.sample
)

# ... repeat for other excursions ...
create_excursion(
  'Sunset Kayaking in Table Bay',
  'Cape Town',
  10,
  'Water Adventure',
  'Friends',
  3,
  'Paddle through the sparkling waters of Table Bay as the sun sets over the Atlantic Ocean.',
  User.all.sample
)

create_excursion(
  'Culinary Delights in Bo-Kaap',
  'Cape Town',
  12,
  'Food Exploration',
  'Family',
  1,
  'Explore the vibrant Bo-Kaap neighborhood, savoring the rich flavors of Cape Malay cuisine.',
  User.all.sample
)

create_excursion(
  'Art Walk through Woodstock',
  'Cape Town',
  8,
  'Cultural Exploration',
  'Friends',
  4,
  'Immerse yourself in the eclectic art scene of Woodstock with a guided walking tour.',
  User.all.sample
)

create_excursion(
  'Wine Tasting in Stellenbosch',
  'Stellenbosch',
  20,
  'Wine Tour',
  'Romantic',
  1,
  'Indulge in a day of wine tasting amidst the picturesque vineyards of Stellenbosch.',
  User.all.sample
)

create_excursion(
  'Scenic Helicopter Tour',
  'Cape Town',
  5,
  'Aerial Adventure',
  'Family',
  1,
  'Soar above Cape Towns landmarks on a thrilling helicopter tour with breathtaking views.',
  User.all.sample
)

create_excursion(
  'Historical Robben Island Visit',
  'Cape Town',
  15,
  'Historical Exploration',
  'Educational',
  3,
  'Uncover the history of South Africa with a guided tour of Robben Island.',
  User.all.sample
)

create_excursion(
  'Surfing Lesson in Muizenberg',
  'Cape Town',
  10,
  'Water Adventure',
  'Friends',
  2,
  'Catch the waves with a surfing lesson at the iconic Muizenberg Beach.',
  User.all.sample
)

create_excursion(
  'Sunrise Yoga at Camps Bay',
  'Cape Town',
  8,
  'Wellness Retreat',
  'Romantic',
  1,
  'Welcome the day with a peaceful sunrise yoga session overlooking Camps Bay.',
  User.all.sample
)

create_excursion(
  'Adventure Zip-lining in Ceres',
  'Ceres',
  12,
  'Adventure Sport',
  'Family',
  3,
  'Experience an adrenaline rush with a zip-lining adventure in the Ceres Valley.',
  User.all.sample
)

create_excursion(
  'Nature Walk in Kirstenbosch Gardens',
  'Cape Town',
  10,
  'Nature Exploration',
  'Friends',
  2,
  'Stroll through the botanical wonders of Kirstenbosch National Botanical Garden.',
  User.all.sample
)

create_excursion(
  'Lion\'s Head Full Moon Hike',
  'Cape Town',
  15,
  'Hiking',
  'Friends',
  2,
  'Embark on a thrilling full moon hike to the summit of Lions Head.',
  User.all.sample
)
create_excursion(
  'Sunset Safari in Aquila Game Reserve',
  'Touws River',
  15,
  'Wildlife Adventure',
  'Family',
  2,
  'Embark on a thrilling sunset safari to witness Africa\'s majestic wildlife in Aquila Game Reserve.',
  User.all.sample
)

create_excursion(
  'Cape Point Scenic Helicopter Tour',
  'Cape Town',
  5,
  'Aerial Adventure',
  'Romantic',
  1,
  'Soar above the breathtaking landscapes of Cape Point on a scenic helicopter tour.',
  User.all.sample
)

create_excursion(
  'Cape Winelands Hot Air Balloon Ride',
  'Stellenbosch',
  10,
  'Wine Tour',
  'Romantic',
  3,
  'Float over the picturesque Cape Winelands in a hot air balloon and enjoy panoramic views.',
  User.all.sample
)

create_excursion(
  'Abseiling Adventure in Table Mountain',
  'Cape Town',
  8,
  'Adventure Sport',
  'Friends',
  2,
  'Challenge yourself with an exhilarating abseiling experience down Table Mountain cliffs.',
  User.all.sample
)

create_excursion(
  'Cape Town Street Art Exploration',
  'Cape Town',
  10,
  'Cultural Exploration',
  'Friends',
  1,
  'Discover the vibrant street art scene of Cape Town through a guided walking tour.',
  User.all.sample
)

create_excursion(
  'Culinary Cruise in Hout Bay',
  'Hout Bay',
  12,
  'Food Exploration',
  'Family',
  2,
  'Savor the flavors of Hout Bay with a culinary cruise featuring local delicacies.',
  User.all.sample
)

create_excursion(
  'Kite Surfing Lesson in Bloubergstrand',
  'Cape Town',
  10,
  'Water Adventure',
  'Friends',
  2,
  'Learn the exhilarating sport of kite surfing on the beautiful beaches of Bloubergstrand.',
  User.all.sample
)

create_excursion(
  'Rock Climbing in Silvermine Nature Reserve',
  'Cape Town',
  8,
  'Adventure Sport',
  'Friends',
  2,
  'Experience the thrill of rock climbing surrounded by the scenic beauty of Silvermine Nature Reserve.',
  User.all.sample
)

create_excursion(
  'Cape Town Jazz Safari Experience',
  'Cape Town',
  15,
  'Music and Culture',
  'Friends',
  2,
  'Immerse yourself in the rich jazz culture of Cape Town with a musical safari experience.',
  User.all.sample
)

create_excursion(
  'Ocean Kayaking with Penguins',
  'Simon\'s Town',
  10,
  'Wildlife Adventure',
  'Family',
  2,
  'Paddle alongside adorable penguins in Simon\'s Town during a unique ocean kayaking adventure.',
  User.all.sample
)
create_excursion(
  'Robben Island Historical Tour',
  'Cape Town',
  20,
  'Historical',
  'Educational',
  3,
  'Visit Robben Island and learn about its rich history and significance as a World Heritage Site.',
  User.all.sample
)

create_excursion(
  'Bo-Kaap Culinary Experience',
  'Cape Town',
  10,
  'Culinary',
  'Couples',
  2,
  'Discover the flavors of Cape Malay cuisine with a cooking class in the colorful Bo-Kaap neighborhood.',
  User.all.sample
)

create_excursion(
  'Kirstenbosch Botanical Gardens Tour',
  'Cape Town',
  15,
  'Nature Walk',
  'Family',
  3,
  'Enjoy a guided tour of the Kirstenbosch Botanical Gardens, one of the great botanic gardens of the world.',
  User.all.sample
)

create_excursion(
  'Boulders Beach Penguin Encounter',
  'Cape Town',
  12,
  'Wildlife',
  'Family',
  2,
  'Visit Boulders Beach and enjoy the unique experience of seeing African penguins in their natural habitat.',
  User.all.sample
)

create_excursion(
  'Cape Winelands Tour',
  'Stellenbosch',
  8,
  'Wine Tasting',
  'Friends',
  6,
  'Explore the scenic vineyards of the Cape Winelands and enjoy tastings of world-renowned wines.',
  User.all.sample
)

create_excursion(
  'Table Mountain Cable Car Ride',
  'Cape Town',
  20,
  'Sightseeing',
  'Tourists',
  1,
  'Experience breathtaking views of Cape Town from the Table Mountain Aerial Cableway.',
  User.all.sample
)

create_excursion(
  'Cape Point Nature Reserve Hike',
  'Cape Town',
  10,
  'Hiking',
  'Adventure',
  4,
  'Embark on a hike in Cape Point Nature Reserve and discover its diverse flora and fauna.',
  User.all.sample
)

create_excursion(
  'Groot Constantia Wine Estate Visit',
  'Cape Town',
  15,
  'Wine Tasting',
  'Adults',
  3,
  'Visit Groot Constantia, South Africas oldest wine producing estate, for a tour and wine tasting.',
  User.all.sample
)

create_excursion(
  'Signal Hill Sunset Viewing',
  'Cape Town',
  20,
  'Scenic View',
  'Romantic',
  2,
  'Witness a spectacular sunset from Signal Hill with panoramic views of the city and ocean.',
  User.all.sample
)

create_excursion(
  'Chapman\'s Peak Drive',
  'Cape Town',
  15,
  'Scenic Drive',
  'Adventure',
  4,
  'Drive along the breathtaking Chapman\'s Peak Drive, known for its stunning ocean views.',
  User.all.sample
)

# Add more excursions following the same pattern

# Continue the pattern for the remaining excursions (excursion3 to excursion15)
# ...

puts "#{Excursion.count} Excursions created"

puts "creating itineraries"

user_sample = User.all.sample

itinerary1 = Itinerary.create!(
  start_time: Time.now + 1.day,
  end_time: Time.now + 1.day + 3.hours,
  description: 'Morning hike with stunning views of Table Mountain.',
  title: 'Mountain Hike',
  user: user_sample
)

itinerary2 = Itinerary.create!(
  start_time: Time.now + 2.days,
  end_time: Time.now + 2.days + 5.hours,
  description: 'Explore the historic neighborhoods of Bo-Kaap and Woodstock.',
  title: 'City Exploration',
  user: user_sample
)

itinerary3 = Itinerary.create!(
  start_time: Time.now + 3.days,
  end_time: Time.now + 3.days + 4.hours,
  description: 'Visit the bustling markets of Greenmarket Square and try local street food.',
  title: 'Market Tour',
  user: user_sample
)

itinerary4 = Itinerary.create!(
  start_time: Time.now + 4.days,
  end_time: Time.now + 4.days + 6.hours,
  description: 'Relaxing day at Camps Bay beach with beach volleyball and paddleboarding.',
  title: 'Beach Day',
  user: user_sample
)

itinerary5 = Itinerary.create!(
  start_time: Time.now + 5.days,
  end_time: Time.now + 5.days + 7.hours,
  description: 'Wine tasting tour in Stellenbosch, exploring the scenic vineyards.',
  title: 'Wine Tasting',
  user: user_sample
)

itinerary6 = Itinerary.create!(
  start_time: Time.now + 6.days,
  end_time: Time.now + 6.days + 4.hours,
  description: 'Day trip to Cape Point and the Cape of Good Hope, enjoy breathtaking ocean views.',
  title: 'Cape Point Excursion',
  user: user_sample
)

itinerary7 = Itinerary.create!(
  start_time: Time.now + 7.days,
  end_time: Time.now + 7.days + 6.hours,
  description: 'Explore the Kirstenbosch National Botanical Garden and enjoy a picnic.',
  title: 'Botanical Garden Visit',
  user: user_sample
)

itinerary8 = Itinerary.create!(
  start_time: Time.now + 8.days,
  end_time: Time.now + 8.days + 5.hours,
  description: 'Scenic drive along Chapman\'s Peak Drive with stops for photos and picnicking.',
  title: 'Chapman\'s Peak Drive',
  user: user_sample
)

itinerary9 = Itinerary.create!(
  start_time: Time.now + 9.days,
  end_time: Time.now + 9.days + 3.hours,
  description: 'Visit the Zeitz Museum of Contemporary Art Africa (MOCAA) and explore modern art.',
  title: 'Art Museum Day',
  user: user_sample
)

itinerary10 = Itinerary.create!(
  start_time: Time.now + 10.days,
  end_time: Time.now + 10.days + 6.hours,
  description: 'Sunset cruise in the Atlantic Ocean, enjoy breathtaking views of the coastline.',
  title: 'Sunset Cruise',
  user: user_sample
)

itinerary11 = Itinerary.create!(
  start_time: Time.now + 11.days,
  end_time: Time.now + 11.days + 4.hours,
  description: 'Guided historical walking tour of Cape Town, exploring colonial architecture.',
  title: 'Historical Walking Tour',
  user: User.all.sample
)

itinerary12 = Itinerary.create!(
  start_time: Time.now + 12.days,
  end_time: Time.now + 12.days + 5.hours,
  description: 'Day trip to Robben Island, visit the former prison and learn about its history.',
  title: 'Robben Island Exploration',
  user: User.all.sample
)

itinerary13 = Itinerary.create!(
  start_time: Time.now + 13.days,
  end_time: Time.now + 13.days + 6.hours,
  description: 'Foodie adventure in Bree Street, sampling local cuisine at various restaurants.',
  title: 'Bree Street Food Tour',
  user: User.all.sample
)

itinerary14 = Itinerary.create!(
  start_time: Time.now + 14.days,
  end_time: Time.now + 14.days + 3.hours,
  description: 'Visit the Two Oceans Aquarium and discover marine life from the Atlantic and Indian Oceans.',
  title: 'Aquarium Exploration',
  user: User.all.sample
)

itinerary15 = Itinerary.create!(
  start_time: Time.now + 15.days,
  end_time: Time.now + 15.days + 7.hours,
  description: 'Sunrise hike up Lion\'s Head for panoramic views of the city and coastline.',
  title: 'Lion\'s Head Sunrise Hike',
  user: User.all.sample
)

itinerary16 = Itinerary.create!(
  start_time: Time.now + 16.days,
  end_time: Time.now + 16.days + 4.hours,
  description: 'Artistic exploration in Woodstock, visit local galleries and street art spots.',
  title: 'Woodstock Art Tour',
  user: User.all.sample
)

itinerary17 = Itinerary.create!(
  start_time: Time.now + 17.days,
  end_time: Time.now + 17.days + 5.hours,
  description: 'Day trip to Hout Bay, explore the harbor and take a boat to Seal Island.',
  title: 'Hout Bay Adventure',
  user: User.all.sample
)

itinerary18 = Itinerary.create!(
  start_time: Time.now + 18.days,
  end_time: Time.now + 18.days + 6.hours,
  description: 'Visit the District Six Museum, learn about the areas history and cultural heritage.',
  title: 'District Six Museum Visit',
  user: User.all.sample
)

itinerary19 = Itinerary.create!(
  start_time: Time.now + 19.days,
  end_time: Time.now + 19.days + 3.hours,
  description: 'Explore the V&A Waterfront, shop, dine, and enjoy live music at the Amphitheatre.',
  title: 'V&A Waterfront Experience',
  user: User.all.sample
)

itinerary20 = Itinerary.create!(
  start_time: Time.now + 20.days,
  end_time: Time.now + 20.days + 7.hours,
  description: 'Guided bicycle tour through the Cape Winelands, visit picturesque vineyards.',
  title: 'Cape Winelands Bike Tour',
  user: User.all.sample
)

itinerary21 = Itinerary.create!(
  start_time: Time.now + 21.days,
  end_time: Time.now + 21.days + 4.hours,
  description: 'Nightlife adventure on Long Street, explore bars, clubs, and live music venues.',
  title: 'Long Street Night Out',
  user: User.all.sample
)

itinerary22 = Itinerary.create!(
  start_time: Time.now + 22.days,
  end_time: Time.now + 22.days + 5.hours,
  description: 'Visit the South African National Gallery, showcasing a diverse range of artworks.',
  title: 'National Gallery Exploration',
  user: User.all.sample
)

itinerary23 = Itinerary.create!(
  start_time: Time.now + 23.days,
  end_time: Time.now + 23.days + 6.hours,
  description: 'Scenic drive along the Garden Route, explore coastal towns and natural wonders.',
  title: 'Garden Route Road Trip',
  user: User.all.sample
)

itinerary24 = Itinerary.create!(
  start_time: Time.now + 24.days,
  end_time: Time.now + 24.days + 3.hours,
  description: 'Visit the Iziko South African Museum, learn about the country\'s natural history.',
  title: 'South African Museum Visit',
  user: User.all.sample
)

itinerary25 = Itinerary.create!(
  start_time: Time.now + 25.days,
  end_time: Time.now + 25.days + 7.hours,
  description: 'Hot air balloon ride over the Cape Winelands, enjoy breathtaking aerial views.',
  title: 'Hot Air Balloon Adventure',
  user: User.all.sample
)

itinerary26 = Itinerary.create!(
  start_time: Time.now + 26.days,
  end_time: Time.now + 26.days + 4.hours,
  description: 'Visit the Rhodes Memorial and enjoy a picnic with panoramic views of the city.',
  title: 'Rhodes Memorial Picnic',
  user: User.all.sample
)

itinerary27 = Itinerary.create!(
  start_time: Time.now + 27.days,
  end_time: Time.now + 27.days + 5.hours,
  description: 'Kayaking adventure in Simon\'s Town, explore the coastal waters and wildlife.',
  title: 'Simon\'s Town Kayak Expedition',
  user: User.all.sample
)

itinerary28 = Itinerary.create!(
  start_time: Time.now + 28.days,
  end_time: Time.now + 28.days + 6.hours,
  description: 'Visit the Kalk Bay Fishing Harbour, enjoy seafood at local restaurants.',
  title: 'Kalk Bay Seafood Experience',
  user: User.all.sample
)

itinerary29 = Itinerary.create!(
  start_time: Time.now + 29.days,
  end_time: Time.now + 29.days + 3.hours,
  description: 'Explore the Company\'s Garden, a peaceful oasis in the heart of the city.',
  title: 'Company\'s Garden Stroll',
  user: User.all.sample
)

puts "#{Itinerary.count} itineraries created"

puts "creating reviews"
# Create Reviews
review_data = [
  { content: 'Ascend to the summit of Table Mountain and enjoy panoramic views of the city and coastline. A breathtaking experience!', user_rating: 5, excursion_id: Excursion.find_by(title: 'Table Mountain Hike').id },
  { content: 'Explore the stunning coastal landscapes along the Cape Peninsula Coastal Drive. A picturesque journey with breathtaking views.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Cape Peninsula Coastal Drive').id },
  { content: 'Paddle through the sparkling waters of Table Bay as the sun sets over the Atlantic Ocean. Sunset Kayaking is a magical adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Sunset Kayaking in Table Bay').id },
  { content: 'Explore the vibrant Bo-Kaap neighborhood, savoring the rich flavors of Cape Malay cuisine. Culinary Delights in Bo-Kaap is a gastronomic journey.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Culinary Delights in Bo-Kaap').id },
  { content: 'Immerse yourself in the eclectic art scene of Woodstock with a guided walking tour. Art Walk through Woodstock is a creative exploration.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Art Walk through Woodstock').id },
  { content: 'Indulge in a day of wine tasting amidst the picturesque vineyards of Stellenbosch. Wine Tasting in Stellenbosch offers exceptional wines.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Wine Tasting in Stellenbosch').id },
  { content: 'Soar above Cape Towns landmarks on a thrilling helicopter tour with breathtaking views. Scenic Helicopter Tour is an aerial adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Scenic Helicopter Tour').id },
  { content: 'Uncover the history of South Africa with a guided tour of Robben Island. Historical Robben Island Visit is an educational journey.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Historical Robben Island Visit').id },
  { content: 'Catch the waves with a surfing lesson at the iconic Muizenberg Beach. Surfing Lesson in Muizenberg is fantastic for beginners.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Surfing Lesson in Muizenberg').id },
  { content: 'Welcome the day with a peaceful sunrise yoga session overlooking Camps Bay. Sunrise Yoga at Camps Bay is a wellness retreat.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Sunrise Yoga at Camps Bay').id },
  { content: 'Experience an adrenaline rush with a zip-lining adventure in the Ceres Valley. Adventure Zip-lining in Ceres is an exhilarating activity.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Adventure Zip-lining in Ceres').id },
  { content: 'Stroll through the botanical wonders of Kirstenbosch National Botanical Garden. Nature Walk in Kirstenbosch Gardens is a peaceful escape.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Nature Walk in Kirstenbosch Gardens').id },
  { content: 'Embark on a thrilling full moon hike to the summit of Lion\'s Head. Lion\'s Head Full Moon Hike is a magical experience.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Lion\'s Head Full Moon Hike').id },
  { content: 'Embark on a thrilling sunset safari to witness Africa\'s majestic wildlife in Aquila Game Reserve. Sunset Safari in Aquila Game Reserve is an unforgettable adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Sunset Safari in Aquila Game Reserve').id },
  { content: 'Soar above the breathtaking landscapes of Cape Point on a scenic helicopter tour. Cape Point Scenic Helicopter Tour is an aerial adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Cape Point Scenic Helicopter Tour').id },
  { content: 'Float over the picturesque Cape Winelands in a hot air balloon and enjoy panoramic views. Cape Winelands Hot Air Balloon Ride is a dreamy adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Cape Winelands Hot Air Balloon Ride').id },
  { content: 'Challenge yourself with an exhilarating abseiling experience down Table Mountain cliffs. Abseiling Adventure in Table Mountain is an adrenaline-pumping activity.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Abseiling Adventure in Table Mountain').id },
  { content: 'Discover the vibrant street art scene of Cape Town through a guided walking tour. Cape Town Street Art Exploration is a colorful journey.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Cape Town Street Art Exploration').id },
  { content: 'Savor the flavors of Hout Bay with a culinary cruise featuring local delicacies. Culinary Cruise in Hout Bay is a delightful food exploration.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Culinary Cruise in Hout Bay').id },
  { content: 'Learn the exhilarating sport of kite surfing on the beautiful beaches of Bloubergstrand. Kite Surfing Lesson in Bloubergstrand is a thrilling water adventure.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Kite Surfing Lesson in Bloubergstrand').id },
  { content: 'Experience the thrill of rock climbing surrounded by the scenic beauty of Silvermine Nature Reserve. Rock Climbing in Silvermine Nature Reserve is an adventurous activity.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Rock Climbing in Silvermine Nature Reserve').id },
  { content: 'Immerse yourself in the rich jazz culture of Cape Town with a musical safari experience. Cape Town Jazz Safari Experience is a unique musical journey.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Cape Town Jazz Safari Experience').id },
  { content: 'Paddle alongside adorable penguins in Simon\'s Town during a unique ocean kayaking adventure. Ocean Kayaking with Penguins is a wildlife adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Ocean Kayaking with Penguins').id },
  { content: 'Visit Robben Island and learn about its rich history and significance as a World Heritage Site. Robben Island Historical Tour is an educational exploration.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Robben Island Historical Tour').id },
  { content: 'Discover the flavors of Cape Malay cuisine with a cooking class in the colorful Bo-Kaap neighborhood. Bo-Kaap Culinary Experience is a culinary delight.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Bo-Kaap Culinary Experience').id },
  { content: 'Enjoy a guided tour of the Kirstenbosch Botanical Gardens, one of the great botanic gardens of the world. Kirstenbosch Botanical Gardens Tour is a nature walk.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Kirstenbosch Botanical Gardens Tour').id },
  { content: 'Visit Boulders Beach and enjoy the unique experience of seeing African penguins in their natural habitat. Boulders Beach Penguin Encounter is a wildlife adventure.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Boulders Beach Penguin Encounter').id },
  { content: 'Explore the scenic vineyards of the Cape Winelands and enjoy tastings of world-renowned wines. Cape Winelands Tour is a wine tasting journey.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Cape Winelands Tour').id },
  { content: 'Experience breathtaking views of Cape Town from the Table Mountain Aerial Cableway. Table Mountain Cable Car Ride offers a sightseeing adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Table Mountain Cable Car Ride').id },
  { content: 'Embark on a hike in Cape Point Nature Reserve and discover its diverse flora and fauna. Cape Point Nature Reserve Hike is an adventurous hiking experience.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Cape Point Nature Reserve Hike').id },
  { content: 'Visit Groot Constantia, South Africa\'s oldest wine-producing estate, for a tour and wine tasting. Groot Constantia Wine Estate Visit offers exceptional wines.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Groot Constantia Wine Estate Visit').id },
  { content: 'Witness a spectacular sunset from Signal Hill with panoramic views of the city and ocean. Signal Hill Sunset Viewing is a romantic experience.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Signal Hill Sunset Viewing').id },
  { content: 'Drive along the breathtaking Chapman\'s Peak Drive, known for its stunning ocean views. Chapman\'s Peak Drive is a scenic drive adventure.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Chapman\'s Peak Drive').id }
]

review_data.each do |review_attrs|
  review = Review.new(review_attrs)
  review.user = User.all.sample
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

# puts "Creating chat rooms"

# Chatroom.create!(itinerary: itinerary1)
# Chatroom.create!(itinerary: itinerary2)
# # ... create more chat rooms as needed

# puts "#{Chatroom.count} Chat rooms created"

# puts "Creating messages"

# # Sample users and chat rooms
# users = User.all
# chatrooms = Chatroom.all

# # Set static created_at and updated_at values
# created_at = Time.now - (30 * 24 * 60 * 60) # 30 days ago
# updated_at = Time.now - (15 * 24 * 60 * 60) # 15 days ago

# users.each do |user|
#   chatrooms.each do |chatroom|
#     Message.create!(
#       user: user,
#       content: "Message from #{user.username}, How's it?",
#       chatroom: chatroom,
#       created_at: created_at,
#       updated_at: updated_at
#     )
#   end
# end

# puts "#{Message.count} Messages created"
