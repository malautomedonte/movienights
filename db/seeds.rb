# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'
require 'date'

puts "Deleting all movies, users, events, bookmarks, event_users, reviews"
EventUser.destroy_all
Event.destroy_all
Review.destroy_all
Movie.destroy_all
User.destroy_all
Bookmark.destroy_all

# Seeding users
puts "Creating users"
User.create!(email: 'jeremy.rome93@gmail.com', password: '123456', username: "RomieRome", location: "Berlin")
User.create!(email: 'clemence.lc@gmail.com', password: '123456', username: "Clemantine", location: "Hamburg")
User.create!(email: 'picture@marcobaass.com', password: '123456', username: "Marcito", location: "Munich")
user = User.new(email: 'sertopico@gmail.com', password: '123456', username: "Il Professore", location: "Rome")
user.save!
puts 'Users created'

# Seeding Movies
puts "Creating movies"
movies = [
  "batman",
  "superman",
  "spiderman",
  "wonder woman",
  "thor",
  "black panther",
  "avengers",
  "dune",
  "james bond",
  "force majeure",
  "lord of the rings",
  "harry potter",
  "hunger games"
]

movies.each do |movie|
  omdb_endpoint = "http://www.omdbapi.com/?t=#{movie}&apikey=a881ace5&plot=full"
  serialized_data = URI.parse(omdb_endpoint).open.read
  result = JSON.parse(serialized_data)

  next if result["Type"] != "movie" || result["Poster"] == "N/A"

  movie = Movie.new(title: result["Title"], release_year: result["Year"].to_i, poster_url: result["Poster"], genre: result["Genre"], description: result["Plot"])
  movie.save!
end
puts "Movies created"

# Seeding events & event_users
puts "Creating events"

20.times do
  event = Event.new(
    title: Faker::Movie.title,
    description: Faker::Movie.quote,
    user_id: User.pluck(:id).sample,
    movie_id: Movie.pluck(:id).sample,
    date: DateTime.now,
    location: "#{Faker::Address.street_address}, #{Faker::Address.city}"
  )
  event.save!
  EventUser.create(user: event.user, event: event)
  # EventUser.create(user: User.pluck(:id).sample, event: event)
end
puts 'Events created'

# Seeding reviews
puts "Creating reviews"
40. times do
  review = Review.new(
    content: Faker::Movie.quote,
    user_id: User.pluck(:id).sample,
    movie_id: Movie.pluck(:id).sample,
    rating: rand(0..5)
  )
  review.save!
end
puts "Reviews created"
