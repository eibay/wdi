require 'sinatra'
require 'json'
require 'httparty'

=begin
his route displays information about a movie in 
JSON format. The movie title will display in the url.
=end
get '/:movie_title' do
=begin
Retain content_type :json because this is an api
=end
content_type :json

=begin
URI encode converts the movie title to a string
=end
url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
# The response will be the display of the movie title.
movie = HTTParty.get(url)

  movie.response.body
end