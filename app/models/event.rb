class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :bookmarks
end
