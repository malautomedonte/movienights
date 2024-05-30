class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :events
  has_many :reviews
  has_many :movie_genres
end
