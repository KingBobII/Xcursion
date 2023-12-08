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
  email: 'jack@gmail.com',
  bio: 'Adventure seeker and nature lover.',
  image: 'https://cdn-icons-png.flaticon.com/128/4333/4333609.png'
)

user2 = User.create!(
  username: 'Tony',
  password: 'password',
  email: 'tony@gmail.com',
  image: 'https://cdn4.iconfinder.com/data/icons/avatars-xmas-giveaway/128/girl_avatar_child_kid-128.png',
  bio: 'Travel enthusiast and foodie.'
)

user3 = User.create!(
  username: 'Jesse',
  password: 'password',
  email: 'april@gmail.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.',
  image: 'https://images.unsplash.com/photo-1504593811423-6dd665756598?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
)

user4 = User.create!(
  username: 'Miles',
  password: 'password',
  email: 'miles@example.com',
  image: "https://images.unsplash.com/photo-1544923246-77307dd654cb?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  bio: 'Passionate about exploring the world and creating unforgettable memories.'
)

user5 = User.create!(
  username: 'James',
  password: 'password',
  email: 'james@example.com',
  bio: 'Passionate about exploring the world and creating unforgettable memories.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user6 = User.create!(
  username: 'Emma',
  password: 'password',
  email: 'emma@example.com',
  bio: 'Adventurous spirit with a love for nature and photography.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user6 = User.create!(
  username: 'Alex',
  password: 'password',
  email: 'alex@example.com',
  bio: 'Tech enthusiast and aspiring entrepreneur.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user7 = User.create!(
  username: 'Sophie',
  password: 'password',
  email: 'sophie@example.com',
  bio: 'Foodie and travel lover on a mission to taste flavors from around the globe.',
  image: 'URL for Sophie\'s image'
)
  user6 = User.create!(
  username: 'Chris',
  password: 'password',
  email: 'chris@example.com',
  bio: 'Fitness freak and outdoor enthusiast.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user16 = User.create!(
  username: 'Olivia',
  password: 'password',
  email: 'olivia@example.com',
  bio: 'Art and culture lover with a passion for creativity.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user7 = User.create!(
  username: 'Daniel',
  password: 'password',
  email: 'daniel@example.com',
  bio: 'Bookworm and aspiring writer.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user8 = User.create!(
  username: 'Ava',
  password: 'password',
  email: 'ava@example.com',
  bio: 'Music lover and concert enthusiast.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)
user9 = User.create!(
  username: 'William',
  password: 'password',
  email: 'william@example.com',
  bio: 'Tech geek and gaming aficionado.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

user10 = User.create!(
  username: 'Mia',
  password: 'password',
  email: 'mia@example.com',
  bio: 'Fashionista and aspiring model.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

user11 = User.create!(
  username: 'Ethan',
  password: 'password',
  email: 'ethan@example.com',
  bio: 'Culinary enthusiast and aspiring chef.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

user12 = User.create!(
  username: 'Avery',
  password: 'password',
  email: 'avery@example.com',
  bio: 'Animal lover and wildlife conservation advocate.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

user13 = User.create!(
  username: 'Oliver',
  password: 'password',
  email: 'oliver@example.com',
  bio: 'Artificial Intelligence researcher and technology futurist.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

user14 = User.create!(
  username: 'Sophia',
  password: 'password',
  email: 'sophia@example.com',
  bio: 'Yoga practitioner and mindfulness advocate.',
  image: 'https://cdn-icons-png.flaticon.com/128/706/706807.png'
)

puts "creating excursions"

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
  excursion.save!
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

puts "#{Excursion.count} Excursions created"

scenic_helicopter_tour = Excursion.find_by(title: 'Scenic Helicopter Tour')

# Add 143 downvotes to 'Scenic Helicopter Tour'
143.times do
  user = User.all.sample
  scenic_helicopter_tour.downvote_from(user)
end

# Add 10 more downvotes to 'Scenic Helicopter Tour'
10.times do
  user = User.all.sample
  scenic_helicopter_tour.downvote_from(user)
end

# puts "#{excursion.get_downvotes.size} downvotes added to #{excursion.title}"
puts "#{Excursion.first.title} has #{Excursion.first.get_downvotes.size} downvotes"
puts "#{Excursion.first.title} has #{Excursion.first.get_upvotes.size} upvotes"
puts "#{Excursion.last.title} has #{Excursion.last.get_downvotes.size} downvotes"
puts "#{Excursion.last.title} has #{Excursion.last.get_upvotes.size} upvotes"
puts "#{Excursion.all.sample.title} has #{Excursion.all.sample.get_downvotes.size} downvotes"
puts "#{Excursion.all.sample.title} has #{Excursion.all.sample.get_upvotes.size} upvotes"

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
  title: 'Weekend In Town',
  user: user1
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

ItineraryExcursion.create(
  excursion_id: Excursion.find_by(title: 'Table Mountain Hike').id,
  itinerary_id: Itinerary.find_by(title: 'Weekend In Town').id
)
ItineraryExcursion.create(
  excursion_id: Excursion.find_by(title: 'Cape Town Jazz Safari Experience').id,
  itinerary_id: Itinerary.find_by(title: 'Weekend In Town').id
)
ItineraryExcursion.create(
  excursion_id: Excursion.find_by(title: 'Cape Town Street Art Exploration').id,
  itinerary_id: Itinerary.find_by(title: 'Weekend In Town').id
)
puts "creating reviews"
# Create Reviews
review_data = [
  { content: 'Ascend to the summit of Table Mountain and enjoy panoramic views of the city and coastline. A breathtaking experience!', user_rating: 5, excursion_id: Excursion.find_by(title: 'Table Mountain Hike').id },
  { content: 'Explore the stunning coastal landscapes along the Cape Peninsula Coastal Drive. A picturesque journey with breathtaking views.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Cape Peninsula Coastal Drive').id },
  { content: 'Paddle through the sparkling waters of Table Bay as the sun sets over the Atlantic Ocean. Sunset Kayaking is a magical adventure.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Sunset Kayaking in Table Bay').id },
  { content: 'Explore the vibrant Bo-Kaap neighborhood, savoring the rich flavors of Cape Malay cuisine. Culinary Delights in Bo-Kaap is a gastronomic journey.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Culinary Delights in Bo-Kaap').id },
  { content: 'Immerse yourself in the eclectic art scene of Woodstock with a guided walking tour. Art Walk through Woodstock is a creative exploration.', user_rating: 5, excursion_id: Excursion.find_by(title: 'Art Walk through Woodstock').id },
  { content: 'Indulge in a day of wine tasting amidst the picturesque vineyards of Stellenbosch. Wine Tasting in Stellenbosch offers exceptional wines.', user_rating: 4, excursion_id: Excursion.find_by(title: 'Wine Tasting in Stellenbosch').id },
  { content: 'Embark on a disappointing helicopter tour over Cape Towns landmarks. The views were underwhelming, and the experience fell far short of expectations. Scenic Helicopter Tour was a regrettable aerial adventure.', user_rating: 1, excursion_id: Excursion.find_by(title: 'Scenic Helicopter Tour').id },
  { content: 'So-called Scenic Helicopter Tour provided a lackluster journey above Cape Town. The "breathtaking views" were nowhere to be found, and the entire experience was a letdown. Save your money for a more enjoyable activity.', user_rating: 1, excursion_id: Excursion.find_by(title: 'Scenic Helicopter Tour').id },
  { content: 'Scenic Helicopter Tour was a waste of time and money. The supposedly breathtaking views were obscured, and the entire experience was anything but thrilling. Avoid this overrated aerial adventure and explore other options.', user_rating: 1, excursion_id: Excursion.find_by(title: 'Scenic Helicopter Tour').id },
  { content: 'The Scenic Helicopter Tour turned out to be a complete disappointment. Instead of a thrilling adventure, it was a mundane ride with subpar views. Dont be fooled by the promises; this aerial tour is not worth the hype.', user_rating: 1, excursion_id: Excursion.find_by(title: 'Scenic Helicopter Tour').id },
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
