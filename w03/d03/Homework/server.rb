require 'sinatra'
require 'httparty'
require 'pry'
get("/") do
	erb(:index)
end

get("/tag") do

	tagword = request.params["tag"]

	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	erb(:secondpage, { locals: { response: response}})	
end

get("/location") do
	lat = request.params["latitude"].to_f
	lon = request.params["longitude"].to_f
	
	response1 = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lon}&client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	erb(:location, {locals: {response1: response1}})
end