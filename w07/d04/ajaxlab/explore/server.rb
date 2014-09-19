require 'sinatra'
# is a ruby gem that requires the sinatra webframework and brings its functionality into our program and lets us write sinatra web applications
require 'json'
# is a ruby gem that requires json, a lightweight data interchange format and brings its functionality into our program that lets us parse JSON requests into ruby
require 'httparty'
# is a ruby gem that is used to work with HTTP APIs and can make get, post etc requests from our server to the url that we pass

get '/:movie_title' do
  # Creates a get request for the path with parameter movie_title
  content_type :json
  # declares the content_type which would be one of the columns in a table in our db to the parameter json

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # sets up the variable url to the class URL on which we call the encode method to encode % between the spaces in our route and sends the request to the url
  movie = HTTParty.get(url)
  # sets up the movie variable to call the get method on httparty to get the url of the omdbapi, bascially makes the api call

  movie.response.body
  # sends the body of the response from the api call
end