require 'sinatra'
require 'json'
require 'httparty'

# Creates a route
get '/:movie_title' do
# Outputs JSON from Sinatra
  content_type :json
# Formats and sets the API response to a variable
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
# Initiates the get request  
  movie = HTTParty.get(url)
# Returns the information
  movie.response.body
end