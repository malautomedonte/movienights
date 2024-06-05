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

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :messages, dependent: :destroy

  has_many :actors, through: :user_actors
  has_many :directors, through: :user_directors
  has_many :genres, through: :user_genres
  has_one_attached :photo

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

  def friendship_with(other_user)
    Friendship.find_by(user_id: self.id, friend_id: other_user.id) ||
    Friendship.find_by(user_id: other_user.id, friend_id: self.id)
  end

  # Methods to retrieve friends
  def friends
    friendships.where(status: 'accepted').map(&:friend) + inverse_friendships.where(status: 'accepted').map(&:user)
  end

  def pending_friendships
    friendships.where(status: 'pending')
  end

  def pending_inverse_friendships
    inverse_friendships.where(status: 'pending')
  end

end
