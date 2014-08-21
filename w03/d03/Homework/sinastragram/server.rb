require 'sinatra'
require 'httparty'
require 'pry'
require 'geocoder'

get("/") do
	erb(:main)
end

get("/photos") do
	tag = request.params["tag_search"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
	
	image_array = []
	response["data"].each do |x|
		image = x["images"]["standard_resolution"]["url"]
		image_array.push(image)
	end
	
	erb(:image_page, {locals: { tag: tag, image_array: image_array } } )
end

get("/lat_long_photos") do 	
	lat = request.params["lat_search"]
	long = request.params["long_search"]
	tag = "Latitude - #{lat}° | Longitude - #{long}°"

	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=4ad7cc36c172434588afd340aa74cd01")

	image_array = []
	response["data"].each do |x|
		image = x["images"]["standard_resolution"]["url"]
		image_array.push(image)
	end

	erb(:image_page, {locals: { tag: tag, image_array: image_array } } )
end

get("/city_state_photos") do 
	city = request.params["city_search"]
	state = request.params["state_search"]

	tag = "#{city}, #{state}"

	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=4ad7cc36c172434588afd340aa74cd01")

	city_state = "#{city}, #{state}"

   coder = Geocoder.search(city_state)


end







