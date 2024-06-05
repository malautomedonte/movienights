class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.global_search(params[:query])
    else
      @movies = Movie.order(release_year: :asc)
    end

    respond_to do |format|
      format.html
      format.text { render partial: "movies/list", locals: {movies: @movies }, formats: [:html] }
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
