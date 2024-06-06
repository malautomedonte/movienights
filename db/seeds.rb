require 'faker'
require 'date'

puts "Deleting all movies, users, events, bookmarks, event_users, reviews, actors, directors, genres 🧼"

User.destroy_all
Movie.destroy_all
Bookmark.destroy_all
Actor.destroy_all
Director.destroy_all
Genre.destroy_all
Friendship.destroy_all
UserGenre.destroy_all
UserActor.destroy_all
UserDirector.destroy_all

# Seeding users
puts "Creating users"
user_jeremy = User.create!(email: 'jeremy.rome93@gmail.com', password: '123456', username: "RomieRome", location: "Berlin")
user_clemence = User.create!(email: 'clemence.lc@gmail.com', password: '123456', username: "Clemantine", location: "Hamburg")
user_marco = User.create!(email: 'picture@marcobaass.com', password: '123456', username: "Marcito", location: "Munich")
user_emma = User.create!(email: 'emma@test.com', password: '123456', username: "Emma", location: "Sweden")
user_roberto = User.create!(email: 'sertopico@gmail.com', password: '123456', username: "Il Professore", location: "Rome")

User.create!(email: 'foo@gmail.com', password: '123456', username: "QuentinBearantino", location: "Berlin")
User.create!(email: 'boo@gmail.com', password: '123456', username: "WesSanderson", location: "Berlin")
User.create!(email: 'goo@gmail.com', password: '123456', username: "BillabongJoon-ho", location: "Berlin")
User.create!(email: 'soo@gmail.com', password: '123456', username: "MartinBoarsese", location: "Berlin")
User.create!(email: 'coo@gmail.com', password: '123456', username: "AkiraBurrowsawa", location: "Berlin")
User.create!(email: 'yoo@gmail.com', password: '123456', username: "DavidGrinch", location: "Berlin")
User.create!(email: 'loo@gmail.com', password: '123456', username: "StevenPeelberg", location: "Berlin")
User.create!(email: 'roo@gmail.com', password: '123456', username: "NicolasRage", location: "Berlin")
User.create!(email: 'zoo@gmail.com', password: '123456', username: "PerishHilton", location: "Berlin")
User.create!(email: 'voo@gmail.com', password: '123456', username: "WillemDafriend", location: "Berlin")
User.create!(email: 'hoo@gmail.com', password: '123456', username: "TomSofty", location: "Berlin")
User.create!(email: 'joo@gmail.com', password: '123456', username: "AlCapuccino", location: "Berlin")
User.create!(email: 'moo@gmail.com', password: '123456', username: "ReeseWithoutaspoon", location: "Berlin")


puts "#{User.count} Users created 🤦🏼 🤦🏼‍♀️ 🤦🏻‍♂️ 🤦🏼‍♀️"

# Seeding Movies
puts "Creating movies, actors, directors and genres"
movies = [
  "angels with dirty faces",
  "crime and punishment",
  "touch of evil",
  "batman",
  "superman",
  "spiderman",
  "wonder woman",
  "thor",
  "black panther",
  "avengers",
  "dune",
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
  "the exorcist",
  "the naked gun",
  "karate kid",
  "e.t. the extra-terrestrial",
  "citizen kane",
  "taxidermia",
  "free fall",
  "his master's voice",
  "in a violent nature",
  "ezra",
  "the dead don't hurt",
  "flipside",
  "speed",
  "summer camp",
  "american pie",
  "furiosa",
  "robot dreams",
  "bad boys: ride or die",
  "hit man",
  "i used to be funny",
  "the watchers",
  "ghostlight",
  "inside out 2",
  "treasure",
  "tuesday",
  "the bikeriders",
  "green border",
  "kinds of kindness",
  "thelma",
  "trigger warning",
  "daddio",
  "horizon: chapter 1",
  "a quiet place: day one",
  "maxxxine",
  "fly me to the moon",
  "longlegs",
  "sing sing",
  "touch",
  "deadpool & wolverine",
  "didi",
  "cuckoo",
  "borderlands",
  "poor things",
  "drive",
  "taxi driver",
  "perfect days",
  "drive my car",
  "climax",
  "the square",
  "triangle of sadness",
  "eyes wide shut",
  "midsommar",
  "zone of interest",
  "leviathan",
  "12 angry men",
  "do the right thing",
  "The Grand Illusion",
  "Seven Samurai",
  "Shoplifters",
  "Burning",
  "Toni Erdmann",
  "The Graduate",
  "in the mood for love",
  "there will be blood",
  "mullholland drive",
  "mystic river",
  "jamon jamon",
  "mother!",
  "biutiful"
]

movie = Movie.new(title: "The third dev", release_year: "2024", poster_url: "https://res.cloudinary.com/dvxwyw52y/image/upload/v1717598157/MV5BYjE2OTdhMWUtOGJlMy00ZDViLWIzZjgtYjZkZGZmMDZjYmEyXkEyXkFqcGdeQXVyNzkwMjQ5NzM_._V1_SX300_vn2jxv.jpg", genre: "Film-Noir, Mystery, Thriller", description: "An out of work pulp fiction novelist, Holly Martins, arrives in a post war Vienna divided into sectors by the victorious allies, and where a shortage of supplies has led to a flourishing black market. He arrives at the invitation of an ex-school friend, Harry Lime, who has offered him a job, only to discover that Lime has recently died in a peculiar traffic accident. From talking to Lime's friends and associates Martins soon notices that some of the stories are inconsistent, and determines to discover what really happened to Harry Lime.")
movie.save!

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

# Seeding UserActors, UserDirectors and UserGenres

puts "Creating preferences for users..."
# 40.times do
#   user_genre = UserGenre.new(
#     user: User.all.sample,
#     genre_id: Genre.pluck(:id).sample
#   )
#   user_genre.save!
# end

# 40.times do
#   user_actor = UserActor.new(
#     user: User.all.sample,
#     actor_id: Actor.pluck(:id).sample
#   )
#   user_actor.save!
# end

# 40.times do
#   user_director = UserDirector.new(
#     user: User.all.sample,
#     director_id: Director.pluck(:id).sample
#   )
#   user_director.save!
# end

User.all.each do |user|
  3.times do
    user_genre = UserGenre.new(user: user, genre_id: Genre.pluck(:id).sample)
    user_genre.save!
  end
  rand(3..5).times do
    user_actor = UserActor.new(user: user, actor_id: Actor.pluck(:id).sample)
    user_actor.save!
  end
  rand(3..5).times do
    user_director = UserDirector.new(user: user, director_id: Director.pluck(:id).sample)
    user_director.save!
  end
end

# UserGenre.create!(user: User.all.sample, genre_id: Genre.pluck(:id).sample)

# UserGenre.create(user: user_roberto, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_roberto, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_roberto, genre_id: Genre.pluck(:id).sample)

# UserActor.create(user: user_roberto, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_roberto, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_roberto, actor_id: Actor.pluck(:id).sample)

# UserDirector.create(user: user_roberto, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_roberto, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_roberto, director_id: Director.pluck(:id).sample)

# UserGenre.create(user: user_jeremy, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_jeremy, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_jeremy, genre_id: Genre.pluck(:id).sample)

# UserActor.create(user: user_jeremy, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_jeremy, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_jeremy, actor_id: Actor.pluck(:id).sample)

# UserDirector.create(user: user_jeremy, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_jeremy, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_jeremy, director_id: Director.pluck(:id).sample)

# UserGenre.create(user: user_marco, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_marco, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_marco, genre_id: Genre.pluck(:id).sample)

# UserActor.create(user: user_marco, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_marco, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_marco, actor_id: Actor.pluck(:id).sample)

# UserDirector.create(user: user_marco, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_marco, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_marco, director_id: Director.pluck(:id).sample)

# UserGenre.create(user: user_clemence, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_clemence, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_clemence, genre_id: Genre.pluck(:id).sample)

# UserActor.create(user: user_clemence, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_clemence, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_clemence, actor_id: Actor.pluck(:id).sample)

# UserDirector.create(user: user_clemence, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_clemence, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_clemence, director_id: Director.pluck(:id).sample)

# UserGenre.create(user: user_emma, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_emma, genre_id: Genre.pluck(:id).sample)
# UserGenre.create(user: user_emma, genre_id: Genre.pluck(:id).sample)

# UserActor.create(user: user_emma, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_emma, actor_id: Actor.pluck(:id).sample)
# UserActor.create(user: user_emma, actor_id: Actor.pluck(:id).sample)

# UserDirector.create(user: user_emma, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_emma, director_id: Director.pluck(:id).sample)
# UserDirector.create(user: user_emma, director_id: Director.pluck(:id).sample)

# Seeding events & event_users
puts "Creating events"


theatres = { "Moviemento" => 'Kottbusser Damm 22, 10967 Berlin', "Neues Off cinema" => 'Hermannstrasse 20, 12049 Berlin',
  "IL KINO" => 'Nansenstrasse 22, 12047 Berlin', "Babylon Kreuzberg" => 'Dresdener Str. 126, 10999 Berlin',
  "Passage Berlin" => 'Karl-Marx-Strasse 131, 12043 Berlin', "Filmtheater am Friedrichshain" => 'Bötzowstrasse 1-5, 10407 Berlin',
  "Babylon" => 'Rosa-Luxemburg-Strasse 30, 10178 Berlin', "Kino Central" => 'Rosenthaler Str. 39, 10178 Berlin',
  "Odeon Berlin" => 'Hauptstrasse 116, 10827 Berlin', "Rollberg Kinos" => 'Rollbergstrasse 70, 12049 Berlin',
  "b-ware Ladenkino" => 'Gärtnerstrasse 19, 10245 Berlin', "Kino International" => 'Karl-Marx-Allee 33, 10178 Berlin'
  }


10.times do
  cinema = theatres.to_a.sample[0]
  movie = Movie.all.sample

  event = Event.new(
    title: movie.title,
    description: movie.description,
    user_id: User.pluck(:id).sample,
    movie_id: movie.id,
    # date: DateTime.now,
    date: DateTime.new(2024, 6, 6, 20, 30, 0),
    theatre: cinema,
    location: theatres[cinema]
  )
  event.save!
  EventUser.create(user: event.user, event: event)
  # EventUser.create(user: User.pluck(:id).sample, event: event)
end
puts "#{Event.count} Events created 🎉"

10.times do
  cinema = theatres.to_a.sample[0]
  movie = Movie.all.sample

  event = Event.new(
    title: movie.title,
    description: movie.description,
    user_id: User.pluck(:id).sample,
    movie_id: movie.id,
    # date: DateTime.now,
    date: DateTime.new(2024, 6, 7, 20, 30, 0),
    theatre: cinema,
    location: theatres[cinema]
  )
  event.save!
  EventUser.create(user: event.user, event: event)
  # EventUser.create(user: User.pluck(:id).sample, event: event)
end
puts "#{Event.count} Events created 🎉"


35.times do
  cinema = theatres.to_a.sample[0]
  movie = Movie.all.sample

  event = Event.new(
    title: movie.title,
    description: movie.description,
    user_id: User.pluck(:id).sample,
    movie_id: movie.id,
    # date: DateTime.now,
    date: DateTime.new(2024, 6, rand(7..14), 20, 30, 0),
    theatre: cinema,
    location: theatres[cinema]
  )
  event.save!
  EventUser.create(user: event.user, event: event)
  # EventUser.create(user: User.pluck(:id).sample, event: event)
end
puts "#{Event.count} Events created 🎉"

# Seeding reviews
puts "Creating reviews"
80. times do
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
