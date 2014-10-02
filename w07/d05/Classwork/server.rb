require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'uri'
require 'pry'

get '/' do 
	erb(:main)
end

get '/posters' do 
	content_type :json
	movie_title = params["title"]
	url = 	URI.encode("http://www.omdbapi.com/?t=#{movie_title}")
	movie = HTTParty.get(url)

	movie.response.body
end
