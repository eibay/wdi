require 'httparty'
require 'sinatra'
require 'pry'



get "/" do
	erb(:index)
end

get "/images" do
	instagram=HTTParty.get("https://api.instagram.com/v1/tags/#{request.params['tag']}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
erb(:images, { locals: { tag: request.params["tag"] , images: instagram['data'] }})
end
get "/location" do
	city=request.params['city'].split(" ").join("+")
	state=request.params['state'].split(" ").join("+")
	google=HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}+#{state}&sensor=false&key=AIzaSyBH66qMfXgrihEfE9HIDagtjdxIBn8N_Fc")
	lat=google["results"][0]["geometry"]["bounds"]["northeast"]["lat"]
	lng=google["results"][0]["geometry"]["bounds"]["northeast"]["lng"]
	instagram=HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=8fe4db31e3a940068664c1e7e3c5c061")

	erb(:location, { locals: {images: instagram["data"] , city: request.params['city'] }})

end