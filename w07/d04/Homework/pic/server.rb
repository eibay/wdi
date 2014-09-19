require 'sinatra' 
require 'json'  
require 'httparty' 


# tag = "snake"
# instagram_things = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})
# image1 = instagram_things["data"][0]["images"]["standard_resolution"]["url"]
# [14] Pry(main)> response["data"][0]["images"]["thumbnail"]["url"]
# https://api.instagram.com/v1/media/popular?client_id=a0553208d1d54032842781cb526dc6c8'
=> "http://scontent-b.cdninstagram.com/hphotos-xfa1/t51.2885-15/10665905_1559750324246362_1663553765_s.jpg"

get("/") do  
	erb(:index)
end

get("/photos") do
	search_word = params["tag"]
	images = HTTParty.get("https://api.instagram.com/v1/tags/#{search_word}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8")
	# mainImage = images["response"]["data"][0]["images"]["thumbnail"]["url"]
	images.to_json
	end


