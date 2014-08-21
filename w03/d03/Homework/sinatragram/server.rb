require "sinatra"
require 'pry'
require "httparty"

get("/") do 
	erb(:index)
end

get("/search") do 
	tag = request.params["tag"]
	images =[]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
	response["data"].each do |image|
		images.push(image["images"]["standard_resolution"]["url"])
	end
	erb(:search_results, { locals: {images: images, tag: tag}})
end 

get("/geographic_search") do 
	tag = request.params["tag"]
	images =[]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
	response["data"].each do |image|
		images.push(image["images"]["standard_resolution"]["url"])
	end
	erb(:search_results, { locals: {images: images, tag: tag}})
end 
