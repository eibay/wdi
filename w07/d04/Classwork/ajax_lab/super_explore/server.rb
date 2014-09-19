require 'sinatra'
require 'json'
require 'httparty'

get '/:movie_title' do
  #serve the code here as JSON
  content_type :json
# make a variable url and URI.encode for spaces from the movie title params
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  movie = HTTParty.get(url)
  # above code HTTParty's that URL getting movie titles from the OMDB API
  # below code looks into the body of the movie response object returned from the HTTParty results
  movie.response.body
end
