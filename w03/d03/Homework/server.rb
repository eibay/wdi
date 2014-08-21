require 'sinatra'
require 'httparty'
require 'pry'

get('/') do
	erb(:index)
end

get('/search') do
	images = []
	tag = request.params["tag"]
	
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
		i = 0
		while i < response["data"].length
		images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
		i +=1
		end

	images = images.join('') 

	erb(:search, { locals: { tag: tag, images: images } })

end


get('/location') do
	images = []
	
	lat = request.params["lat"]
	lng = request.params["lng"]
	location_id = []

	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=6e4453d0a1e84159a1b28c13d09916cb")

		i = 0
		while i < response["data"].length
		images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
		i +=1
		end

	images = images.join('') 

	erb(:location, { locals: { lat: lat, lng: lng, images: images } })

end

