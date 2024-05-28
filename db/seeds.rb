# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Deleting all movies, users, events, bookmarks, event_users, reviews"
Movie.destroy_all
User.destroy_all
Event.destroy_all
Bookmark.destroy_all
EventUser.destroy_all
Review.destroy_all

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
  "force majeure"
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
