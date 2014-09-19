require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'
require 'uri'



get '/' do 

# for the time being, until i figure out how to make a button work
movie_title = 'dog day afternoon'
response = JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}"))
# response = URI.encode(HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}"))
# response = URI.encode(JSON.parse(HTTParty.get("http://www.omdbapi.com/?t=#{movie_title}")))

poster = response["poster"]
	erb(:index, {locals: {response: response, poster: poster}})
end






