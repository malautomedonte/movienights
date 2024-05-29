class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search_movies(params[:query])
    else
      @movies = Movie.all
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
  end

end
