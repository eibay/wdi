require 'sinatra'
# require 'pry'
require 'httparty'
require 'geocoder'

# vars & methods for the Instagram API # 

$access_token = "4ad7cc36c172434588afd340aa74cd01"  

def tagged so
	url = "https://api.instagram.com/v1/tags/#{so}/media/recent?client_id=#{$access_token}"
	results = HTTParty.get url 
	results["data"].map do |result|
		result["images"]["standard_resolution"]["url"]
	end 
end

def located *so
	imgs = []
	lat, lng = so  
	url_f = "https://api.instagram.com/v1/locations/search?lat=#{lat}&lng=#{lng}&distance=100&client_id=#{$access_token}"
	results = HTTParty.get url_f  
	lids = results["data"].map do |result|
		result["id"] 
	end 
	lids.each do |lid|
		url_s = "https://api.instagram.com/v1/locations/#{lid}/media/recent?client_id=#{$access_token}"
		results = HTTParty.get(url_s)["data"].each do |result|
			imgs << result["images"]["standard_resolution"]["url"]
		end 
	end 
	imgs 
end 

# main app # 
 
get '/' do
	erb :index 
end

get "/tags" do 
	t = request.params["tag"]
	imgs = tagged t
	erb :tags, {locals: {imgs: imgs }} 
end 

get "/cities" do 
	c = request.params["city"]
	ll = Geocoder.search(c)[0].data["geometry"]["location"]
	lat, lng = ll["lat"], ll["lng"]
	imgs = located lat, lng
	erb :cities, {locals: {imgs: imgs }} 
end