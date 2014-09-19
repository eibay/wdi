#require sinatra framework
require 'sinatra'
#require json
require 'json'
#require httparty gem
require 'httparty'
#require more shit
require 'uri'
#get movie title url, will be requested using request in the server.js
get '/:movie_title' do
	#send content back as json
  content_type :json
  #encode url so it actually works when you send to httparty on the next line
  url = URI.encode("http://www.omdbapi.com/?t=#{params[:movie_title]}")
  #make an httparty get request to above url
  movie = HTTParty.get(url)
  #send the results from the http request
  movie.response.body
end