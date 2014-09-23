
# use the sinatra web framework 
require 'sinatra'
# use the json & httparty libraies  
require 'json' 
require 'httparty'

# when the server recieves a get request for a path  
# assume the string following the first forward slash is a film title 
get '/:movie_title' do
  # set HTTP response body's Content-Type in the HTTP response header  
  # http://rubydoc.info/github/sinatra/sinatra/Sinatra/Helpers:content_type
  # http://en.wikipedia.org/wiki/List_of_HTTP_header_fields#Response_fields 
  # to JSON 
  content_type :json 

  # replace chars unusable in a uri w/ uri escape sequences 
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")

  # send out a get request to omdb api 
  movie = HTTParty.get(url)

  # send the json str in the response body 
  # of the response from the api 
  # to the client 
  movie.response.body
end