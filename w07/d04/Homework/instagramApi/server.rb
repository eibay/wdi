require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'httparty'
require 'pry'
require 'uri'

get '/' do
	File.read('./index.html')
end

get '/:location' do

	location = URI.encode(params["location"])

	geo = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}")

	lat = geo["results"][0]["geometry"]["location"]["lat"].to_s
	lng = geo["results"][0]["geometry"]["location"]["lng"].to_s

	instagramAPI = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&client_id=6e4453d0a1e84159a1b28c13d09916cb")
	
	data = instagramAPI["data"]

	imageArray=[]
	
	data.each do |post|
		url =post["images"]["thumbnail"]["url"]
		hash = {url: url}
		imageArray.push(hash)
	end

	return imageArray.to_json

end


