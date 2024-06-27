class MoviesController < ApplicationController
  def index
    tmdb_service = TmdbService.new

    if params[:query].present?
      response = tmdb_service.search_movies(params[:query])

      if response.success?
        @movies = process_tmdb_movies(response['results'], tmdb_service)
      else
        @movies = []
        flash[:error] = "There was an error fetching movies from TMDb."
      end
    else
      response = tmdb_service.random_movies

      if response.success?
        @movies = process_tmdb_movies(response['results'], tmdb_service)
      else
        @movies = []
        flash[:error] = "There was an error fetching movies from TMDb."
      end
    end

    respond_to do |format|
      format.html
      format.text { render partial: "movies/list", locals: { movies: @movies }, formats: [:html] }
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

  def process_tmdb_movies(movies, tmdb_service)
    movies.map do |movie|
      credits_response = tmdb_service.get_movie_credits(movie['id'])
      if credits_response.success?
        movie['directors'] = credits_response['crew'].select { |crew| crew['job'] == 'Director' }.map { |director| director['name'] }
        movie['cast'] = credits_response['cast'].map { |actor| actor['name'] }
      else
        movie['directors'] = []
        movie['cast'] = []
      end
      movie
    end
  end
end
