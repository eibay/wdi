#REQUIRE SINATRA GEM TO CREATE SERVER
require 'sinatra'
#TO READ JSON
require 'json'
#TO HIT OMDBAPI
require 'httparty'

#WHEN CLIENT REACHES ROUTE 
get '/:movie_title' do
  #?? 
  content_type :json
  # TO ENCODE MOVIE TITLE TO MAKE URL READABLE -- TRUE GRIT = TRUE%20GRIT
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  # HITTING API AND SETTING RETURNED JSON TO MOVIE VARIABLE
  movie = HTTParty.get(url)

  #RETURNING THE JSON STRING
  movie.response.body
#HANG UP
end