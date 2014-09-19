require 'sinatra'
require 'json'
require 'httparty'
# require all these things

get '/:movie_title' do
  # if movie title is the path
  content_type :json
  # it is in json

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  movie = HTTParty.get(url)
  #go to httparty and get this API and URI encode it

  movie.response.body
  #get the body of the response from api
end