require 'sinatra'
require 'json'
require 'haml'
require 'httparty'

get '/' do 

	haml :index 
end 

get "/search" do 
	title = URI.encode params["title"]
	api_url = "http://www.omdbapi.com/?t=#{title}"
	movie_json = HTTParty.get api_url 
	result = JSON.parse movie_json 
	result["Poster"]
end 