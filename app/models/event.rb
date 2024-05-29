class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :bookmarks
  has_many :event_users

  validates :title, :date, :location, presence: true
end
