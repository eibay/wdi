require 'sinatra'
require 'pry'
require 'HTTParty'

get("/") do
	erb(:index)
end

get("/photos") do

	tag = request.params["tag"]
	photos = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
	
	erb(:photos, { locals: { tag: tag, photos: photos}})

end
