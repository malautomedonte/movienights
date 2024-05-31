class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :events
  has_many :reviews
  has_many :movie_genres, dependent: :destroy
  has_many :movie_directors, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
end
