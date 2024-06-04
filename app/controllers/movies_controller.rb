class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @event = Event.new
  end

  private

  def movie_params
  end

end
