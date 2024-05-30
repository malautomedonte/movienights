class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events
  has_many :event_users
  has_many :reviews

  # This is made in order to validate the user's preferences
  # validates :favorite_genres, presence: true
  # validates :favorite_directors, presence: true
  # validates :favorite_actors, presence: true

  def find_movie_buddies
    User.where.not(id: self.id)
        .where("favorite_genres && ARRAY[?]::varchar[] OR favorite_directors && ARRAY[?]::varchar[] OR favorite_actors && ARRAY[?]::varchar[]",
               self.favorite_genres.split(','),
               self.favorite_directors.split(','),
               self.favorite_actors.split(','))
  end
end
