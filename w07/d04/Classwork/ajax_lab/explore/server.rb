require 'sinatra'
require 'json'
require 'httparty'

get '/:movie_title' do
  content_type :json

  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  movie = HTTParty.get(url)

  movie.response.body
end