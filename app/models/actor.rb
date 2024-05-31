class Actor < ApplicationRecord
  has_many :movie_actors
  has_many :movies, through: :movie_actors

  def full_name
    "#{first_name} #{last_name}"
  end
end
