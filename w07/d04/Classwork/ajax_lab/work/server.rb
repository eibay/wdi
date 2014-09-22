require 'sinatra'
require 'json'
require 'httparty'


# This is our first and only route, which allows for a param called movie_title.
get '/:movie_title' do
	# I've never seen this before but, in context, it seems to be telling sinatra that we'll be getting a JSON response
  content_type :json
  # We convert the param into URI
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # and make the request
  movie = HTTParty.get(url)
  # Then serve it to the client
  movie.response.body
end