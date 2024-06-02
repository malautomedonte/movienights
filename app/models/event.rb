class Event < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  has_many :bookmarks
  has_many :event_users, dependent: :destroy
  has_many :messages, dependent: :destroy

  validates :date, :location, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
