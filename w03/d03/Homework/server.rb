require "sinatra"
require "httparty"
require "pry"

get("/") do 
	erb(:index)
end

get("/search_tag") do
	tag = request.params["tag"]
	insta = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
	erb(:search_tag, { locals: { tag: tag, images: insta } })
end

get("/search_loc") do
	loc = request.params["loc"].split(" ").join("+")

	googloc = HTTParty.get("http://maps.googleapis.com/maps/api/geocode/json?address=#{loc}")
	lat = googloc["results"][0]["geometry"]["location"]["lat"] 
	lng = googloc["results"][0]["geometry"]["location"]["lng"] 

	instaloc = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=6e4453d0a1e84159a1b28c13d09916cb")

	erb(:search_loc, { locals: { loc: loc, images: instaloc } })
end
	