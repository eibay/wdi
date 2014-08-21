require 'sinatra'
require 'pry'
require 'httparty'

get("/") do
	erb(:index)
end
# puts "get index erb"
  	

get("/photo_page") do
	tag = request.params["tag"]
	photos = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=267f9747893548ab86d79baff64cb209")
	erb(:photo_page, { locals: { tag: tag, photos: photos } })
#binding.pry
end
puts "get photo_page"


