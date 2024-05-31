class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :event_users, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :user_actors, dependent: :destroy
  has_many :user_directors, dependent: :destroy
  has_many :user_genres, dependent: :destroy

  has_many :actors, through: :user_actors
  has_many :directors, through: :user_directors
  has_many :genres, through: :user_genres

  # def find_movie_buddies

  # end
end
