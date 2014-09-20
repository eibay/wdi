require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'uri'
require 'json'


get '/' do
	File.read('./index.html')
end

get '/:movie' do

	movie = params["movie"]
	omdb_call = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie}"))
	image_url = omdb_call["Poster"]

	return image_url
	
end
