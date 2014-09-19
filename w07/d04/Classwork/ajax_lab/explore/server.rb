# require sinatra
require 'sinatra'
# require json
require 'json'
# require json
require 'httparty'

# when path hits /:movie_title
get '/:movie_title' do

  content_type :json
# encode url
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
# get data from what in ()
  movie = HTTParty.get(url)

  movie.response.body
end