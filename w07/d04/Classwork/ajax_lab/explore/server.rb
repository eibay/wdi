drequire 'sinatra' #framework
require 'json'  #structured string data typey
require 'httparty'  #gem for api requests

get '/:movie_title' do #this route will be hit with a dynamic value/movie_title
  content_type :json  #dont know

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")  #this makes a url with the movie title and will replace spaces and bad characters that cant be in urls 
  movie = HTTParty.get(url) # this makes the API request using a gem and the url.

  movie.response.body #this is the whole returned api request
end