require 'faker'
require 'date'

puts "Deleting all movies, users, events, bookmarks, event_users, reviews, actors, directors, genres 🧼"

User.destroy_all
Movie.destroy_all
Bookmark.destroy_all
Actor.destroy_all
Director.destroy_all
Genre.destroy_all

# Seeding users
puts "Creating users"
User.create!(email: 'jeremy.rome93@gmail.com', password: '123456', username: "RomieRome", location: "Berlin")
User.create!(email: 'clemence.lc@gmail.com', password: '123456', username: "Clemantine", location: "Hamburg")
User.create!(email: 'picture@marcobaass.com', password: '123456', username: "Marcito", location: "Munich")
User.create!(email: 'emma@test.com', password: '123456', username: "Emma", location: "Sweden")
user = User.new(email: 'sertopico@gmail.com', password: '123456', username: "Il Professore", location: "Rome")
user.save!

puts "#{User.count} Users created 🤦🏼 🤦🏼‍♀️ 🤦🏻‍♂️ 🤦🏼‍♀️"

# Seeding Movies
puts "Creating movies, actors, directors and genres"
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
  "hunger games",
  "blade runner",
  "casablanca",
  "metropolis",
  "the usual suspects",
  "fight club",
  "the matrix",
  "la dolce vita",
  "vacanze romane",
  "shining",
  "barry lindon",
  "a clockwork orange",
  "once upon a time in hollywood",
  "pulp fiction",
  "kill bill",
  "someone likes it hot",
  "howl's moving castle",
  "toy story",
  "the emperor's new groove",
  "total recall",
  "robocop",
  "nosferatu",
  "dracula",
  "interview with the vampire",
  "the eternal sunshine of the spotless mind",
  "the groundhog day",
  "ghostbusters",
  "inception",
  "2001: a space odyssey",
  "home alone",
  "a woman under the influence",
  "once upon a time in america",
  "vertigo",
  "psycho",
  "the sky above berlin",
  "it's a wonderful life",
  "the silence of the lambs",
  "city of god",
  "one flew over the cuckoo's nest",
  "alien",
  "aliens",
  "the green mile",
  "memento",
  "wall-e",
  "the great dictator",
  "american beauty",
  "old boy",
  "ace ventura",
  "scarface",
  "indiana jones",
  "l.a. confidential",
  "jurassic park",
  "no country for old men",
  "monty python",
  "rashomon",
  "the deer hunter",
  "trainspotting",
  "la haine",
  "into the wild",
  "the exorcist"
]

movies.each do |movie|
  omdb_endpoint = "http://www.omdbapi.com/?t=#{movie}&apikey=a881ace5&plot=full"
  serialized_data = URI.parse(omdb_endpoint).open.read
  result = JSON.parse(serialized_data)
  next if result["Type"] != "movie" || result["Poster"] == "N/A"

  movie = Movie.new(title: result["Title"], release_year: result["Year"].to_i, poster_url: result["Poster"], genre: result["Genre"], description: result["Plot"])
  movie.save!

  directors = result["Director"].split(',')

  directors.each do |director|
    names = director.split(" ")
    last_name = names.pop
    first_names = names.join(" ")
    director = Director.find_or_create_by(first_name: first_names, last_name: last_name)
    MovieDirector.find_or_create_by(director_id: director.id, movie_id: movie.id)
  end

  actors = result["Actors"].split(',')

  actors.each do |actor|
    names = actor.split(" ")
    last_name = names.pop
    first_names = names.join(" ")
    actor_new = Actor.find_or_create_by(first_name: first_names, last_name: last_name)
    MovieActor.find_or_create_by(actor_id: actor_new.id, movie_id: movie.id)
  end

  genres = result["Genre"].split(',')

  genres.each do |genre|
    genre.strip!
    genre_new = Genre.find_or_create_by(title: genre)
    MovieGenre.find_or_create_by(genre_id: genre_new.id, movie_id: movie.id)
  end
end

puts "#{Movie.count} Movies created 🍿"
puts "#{Actor.count} Actors created 💃"
puts "#{Director.count} Directors created 😎"
puts "#{Genre.count} Genres created 💥"

puts "#{MovieActor.count} MovieActors created 🤝🏼"
puts "#{MovieDirector.count} MovieDirectors created 🤝🏼"
puts "#{MovieGenre.count} MovieGenres created 🤝🏼"

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
puts "#{Event.count} Events created 🎉"

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
puts "#{Review.count} Reviews created 💬"

puts "Seeds are done 🌱🌱🌱"
