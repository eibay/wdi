require 'sinatra'
require "pry"
require 'HTTParty'
require 'json'

get("/") do 
	erb(:index)
end

get("/pic_search") do

	tag = request.params["picture"] 
	tag_request = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d")
	images = []
	
	tag_request["data"].each do |a|
			images.push a["images"]["low_resolution"]["url"]
		end
	erb(:picture, {locals: {images: images}})
end
get("/lat_long_photos") do 

	lat = request.params["lat"]
	long = request.params["long"]
	tag_request = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=3afaee9a98b343d580e11c3228a8653d")
	
	tags_location = []
	tag_request["data"].each do |a|
		tags_location.push a["images"]["low_resolution"]["url"]
	end
	
	erb(:geo_search, {locals: {location: tags_location}})

end