class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :events
  has_many :reviews
  # include PgSearch::Model

  # # pg_search_scope :search_movies,
  # # against: [ :title, :description, :genre ],
  # # using: {
  # #   tsearch: { prefix: true }
  # # }
end
