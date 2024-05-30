class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :event_users
  has_many :reviews
  has_many :user_actors
  has_many :user_directors
  has_many :user_genres

  has_many :actors, through: :user_actors
  has_many :directors, through: :user_directors
  has_many :genres, through: :user_genres

  def find_movie_buddies

  end
end
