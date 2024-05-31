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

  def preferred_content
    preferred_movies = []

    self.genres.uniq.each do |genre|
      preferred_movies.concat(genre.movies)
    end

    self.actors.uniq.each do |actor|
      preferred_movies.concat(actor.movies)
    end

    self.directors.uniq.each do |director|
      preferred_movies.concat(director.movies)
    end

    preferred_movies.uniq # Ensure unique movies
  end

  def similar_users
    all_users = User.where.not(id: self.id)
    similar_users = all_users.select do |user|
      (self.genres & user.genres).any? ||
      (self.actors & user.actors).any? ||
      (self.directors & user.directors).any?
    end
    
    similar_users
  end
end
