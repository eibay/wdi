require 'sinatra'
require 'json'
require 'httparty'

# We are working on a ruby file and requiring a ruby gem called json as well as the other ruby gems that we are used to requiring

get '/:movie_title' do 
	# this is a dynamic path that grabs the params movie title and executes a line of code. 
  content_type :json
  # this returns the information that we get as json meaning it is a string with format of array and hashes. 

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # encodeURI method does not encode the following characters: ":", "/", ";", and "?"
  # we also see that the params is dynamic
  movie = HTTParty.get(url)
  # we get the API of the url

  movie.response.body
  # gives you the body of the response. 
end