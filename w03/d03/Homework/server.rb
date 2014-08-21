require 'sinatra'
require 'pry'
require 'httparty'

get("/") do
	erb(:index)	
end

get("/tags") do
	tag = request.params["tag"]
	tag_request = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe")
	
	image_array = []
	tag_request["data"].each do |a|
		image = a["images"]["low_resolution"]["url"]
		image_array.push(image)
	end

	erb(:image, {locals: { tag: tag, image_array: image_array } } )
	
end
