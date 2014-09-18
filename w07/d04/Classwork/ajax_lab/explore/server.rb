require 'sinatra'
require 'json'
require 'httparty'

# ruby gets the movie from omdb

# path /:movie_title (title comes from url below)
get '/:movie_title' do
	# unfamiliar syntax , i'm told it makes response(?) JSON
  content_type :json
  # setting API url to variable and encoding to avoid %20% and stuff
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # sending http request to API
  movie = HTTParty.get(url)
  # here's the body of the response from the API, but we're not doing anything with it
  movie.response.body
end