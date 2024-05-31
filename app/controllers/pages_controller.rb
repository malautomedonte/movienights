class PagesController < ApplicationController

  def home
    @movies = Movie.all
    @events = Event.all
    @events_today = Event.where('date between ? and ?', DateTime.now.beginning_of_day, DateTime.now.end_of_day)
  end

  def index
    @recommended_movies = Movie.where("genre ILIKE ANY (array[?]) OR director ILIKE ANY (array[?]), OR actors ILIKE ANY (array[?])",
                                      current_user.favorite_genres.split(',').map { |g| "%#{g}%}" },
                                      current_user.favorite_directors.split(',').map { |d| "%#{d}%}" },
                                      current_user.favorite_actors.split(',').map { |a| "%#{a}%}" })
    @movie_buddies = current_user.find_movie_buddies
  end
end
