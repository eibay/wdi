require 'sinatra'
require 'pry'
require 'httparty'

get("/") do 
	erb(:index)
end

get("/tag") do
	tag = request.params["search"]
	instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")

	erb(:tag, { locals: {tag: tag, instagram_api: instagram_api } })

end

