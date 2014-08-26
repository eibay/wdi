require 'sinatra'
require 'pry'
require 'httparty'
require 'geocoder'

tags = []

get("/") do
	erb(:index)
end

get("/word") do
	tag = request.params["specific_word"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
	response = response["data"]
	images = []

	response.each do |thing|
		url = thing["images"]["standard_resolution"]["url"]
		images << "<a href='#{url}'><img src='#{url}'></a>"
	end

	erb(:pictures, { locals: {images: images, tag: tag } })
end

get("/location") do
	lat = request.params["specific_latitude"]
	lng = request.params["specific_longitude"]
	response = HTTParty.get("https://api.instagram.com/v1/locations/search?lat=#{lat}&lng=#{lng}&client_id=4c08eb6f8fb948d581437e9315b48fb2")
	location = response["data"][0]["id"]
	response = HTTParty.get("https://api.instagram.com/v1/locations/#{location}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
	response = response["data"]
	images = []

	response.each do |thing|
		url = thing["images"]["standard_resolution"]["url"]
		images << "<a href='#{url}'><img src='#{url}'></a>"
	end

	erb(:locations, { locals: {images: images, lat: lat, lng: lng } })
end

get("/city_state") do
	city_state = request.params["specific_city"].gsub('/', ', ')
	d = Geocoder.search(city_state)
    ll = d[0].data["geometry"]["location"]
    lat = "#{ll['lat']}"
    lng = "#{ll['lng']}"
	response = HTTParty.get("https://api.instagram.com/v1/locations/search?lat=#{lat}&lng=#{lng}&client_id=4c08eb6f8fb948d581437e9315b48fb2")
	locations = response["data"]
	locations.each do |location|
		location_id = location["id"]
		response = HTTParty.get("https://api.instagram.com/v1/locations/#{location_id}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")
		response = response["data"]
	end
	images = []

	response.each do |thing|
		url = thing["images"]["standard_resolution"]["url"]
		images << "<a href='#{url}'><img src='#{url}'></a>"
	end

	erb(:city_state, { locals: {images: images, city: city_state } })
end

post("/favorite") do
	tag = request.query_string.split("=")[1]
	tags << "<li>#{tag}</li>"
	erb(:favorite, { locals: {tags: tags.join(' ') } })
end

### Seaching by city/state only works when HTTParty could gets url correctly...###