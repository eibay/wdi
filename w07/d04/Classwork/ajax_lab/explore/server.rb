# ruby server that makes an API call to OMDB
# gets sinatra gem so we can make a server
require 'sinatra'
# gets json gem so we can read/write json
require 'json'
# gets httparty gem so we can make API call
require 'httparty'

# establishes route for the request with the movie title as a query param
get '/:movie_title' do
	# establishes that the content type of this route is json
  content_type :json
  # sets a variable 'url' to the OMDB url with the movie title param URI encoded attached as a query 
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # sets a variable movie to the HTTParty API request
  movie = HTTParty.get(url)
  # calls the body param of the API response to be served
  movie.response.body
end