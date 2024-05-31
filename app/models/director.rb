class Director < ApplicationRecord
  has_many :movie_directors
  has_many :movies, through: :movie_directors

  def full_name
    "#{first_name} #{last_name}"
  end
end
