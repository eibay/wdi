require 'sinatra'
require 'json'
require 'httparty'

get '/:movie_title' do
	# accepts the above route from the js server
  content_type :json
  #formats the response it gives in JSON
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # encodes the movie title into URI so that it becomes a valid url
  movie = HTTParty.get(url)
  # sends an HTTParty request to omdb re: the movie title
  movie.response.body
  # returns omdb's response body to the JS server
end