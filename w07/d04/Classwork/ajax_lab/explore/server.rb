# require sinatra for site
require 'sinatra'
# require json allowing us to parse data
require 'json'
# require httparty to get data from external sources
require 'httparty'

require 'uri'


# route to :movie_title
get '/:movie_title' do
  content_type :json

# editing the string to be used in the url 
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  movie = HTTParty.get(url)

# shows the response of the parsed.request
  movie.response.body
end