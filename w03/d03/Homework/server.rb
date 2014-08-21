require 'sinatra'
require 'httparty'
require 'pry'

get("/") do 
	erb(:index)	
end

get("/search") do
	hashtag = request.params["tag"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{request.params["tag"]}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f
")

	image_array = []
binding.pry

	response["data"].each do |x|
	image = x["images"]["standard_resolution"]["url"]
	image_array.push(image)

end
erb(:search, { locals: { tag: request.params["tag"], image_array: image_array } })
end

#bonus, using instagram api for location

get("/lat_long") do
	lat = request.params["lat"]
	lng = request.params["long"]
	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=3bbdd8399e754e5b8e24bd968905298f")

	image_array = []
	response["data"].each do |x|
	image = x["images"]["standard_resolution"]["url"]
	image_array.push(image)

end
erb(:lat_long , { locals: { tag: " Coordinates: #{lat}, #{long}", image_array: image_array } })
end




