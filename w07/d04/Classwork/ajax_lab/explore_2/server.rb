require 'sinatra'
require 'json'
require 'httparty'

get '/:movie_title' do #when path is this, do the following
  content_type :json  

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}") #encodes spaces into html friendly stuff
  # also makes it so you can dynamically find the movies you want, and then formats it so you can search the right url in the api
  movie = HTTParty.get(url) # parses the array of hashes from json

  movie.response.body # shows the body of the response of the parsed materials
end