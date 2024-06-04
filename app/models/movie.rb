class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :events
  has_many :reviews
  has_many :movie_genres, dependent: :destroy
  has_many :movie_directors, dependent: :destroy
  has_many :movie_actors, dependent: :destroy
  has_many :actors, through: :movie_actors
  has_many :directors, through: :movie_directors

  include PgSearch::Model
  pg_search_scope :global_search,
  against: [ :title ],
  associated_against: {
    directors: [ :first_name, :last_name],
    actors: [ :first_name, :last_name]
  },
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
