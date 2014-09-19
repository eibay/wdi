require 'sinatra'
require 'json'
require 'httparty'
require 'haml'
require 'geocoder'
require 'pry'

# interface to instagram # 

$instagram_api_key = "17a4630338cd4da38b94cbbecd787fae"

def tagged tag 
	url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=#{$instagram_api_key}"
	results = HTTParty.get url 
	results["data"].map do |result|
		result["images"]["standard_resolution"]["url"]  
	end 
end 


def get_lat_lng city 
	Geocoder.search(city)[0].data["geometry"]["location"] 
end 

def located location
	imgs = []
	lat, lng = [location["lat"], location["lng"]]   
	url_f = "https://api.instagram.com/v1/locations/search?lat=#{lat}&lng=#{lng}&distance=75&client_id=#{$instagram_api_key}"
	results = HTTParty.get url_f  
	location_ids = results["data"].map do |result|
		result["id"] 
	end 
	location_ids.each do |location_id|
		url_s = "https://api.instagram.com/v1/locations/#{location_id}/media/recent?client_id=#{$instagram_api_key}"
		results = HTTParty.get(url_s)["data"].each do |result|
			imgs << result["images"]["standard_resolution"]["url"]
		end 
	end 
	imgs 
end 

# routes # 

get '/' do 

	haml :index
end

get '/pictures' do 
	content_type :json 
	
	search = params["search"]
	city = params["city"]

	if city 
		city = located(get_lat_lng(city))
		
	end 

	if search 
		search = tagged search
	end 
	
	# thought I could go 
	# city & search 
	# which would return pictures belonging to both arrays 
	# but rarely have anything in common so... 
	# in this best of all possible worlds, this is enough: 

	[city, search].flatten.to_json 
end 