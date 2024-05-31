class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :bookmarks
  has_many :event_users
  has_many :messages

  validates :title, :date, :location, presence: true
end
