class TmdbService
  include HTTParty
  base_uri 'https://api.themoviedb.org/3'

  def initialize
    @api_key = '3d33914d8fa3f7689162d43bce0ba2a4' # Replace with your actual TMDb API key
  end

  def search_movies(query)
    options = { query: { api_key: @api_key, query: query } }
    self.class.get('/search/movie', options)
  end

  def get_movie_credits(movie_id)
    options = { query: { api_key: @api_key } }
    self.class.get("/movie/#{movie_id}/credits", options)
  end

  def random_movies
    options = { query: { api_key: @api_key, sort_by: 'popularity.desc', page: rand(1..500) } }
    self.class.get('/discover/movie', options)
  end
end
