class Bookmark < ApplicationRecord
  belongs_to :movie, polymorphic: true
  belongs_to :event, polymorphic: true
  belongs_to :user
end
