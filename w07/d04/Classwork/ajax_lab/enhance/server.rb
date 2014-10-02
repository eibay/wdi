require 'sinatra'
require 'json'
require 'httparty'

get '/:movie_title' do
  content_type :json
# sets the 'content_type' to json
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  movie = HTTParty.get(url)
# url equals the the encoded version of the url passed
# movie equals the get request of url
  movie.response.body
# returns the body of the response
end