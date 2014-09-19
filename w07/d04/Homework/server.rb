require 'sinatra'
require 'json'
require 'httparty'
require 'uri'
require 'sinatra/reloader'
require 'pry'



get('/') do
	erb(:insta_with_map)
end



get '/images' do

  content_type :json
  city=params[:city].split(" ").join("+")
  google=HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}&sensor=false&key=AIzaSyBH66qMfXgrihEfE9HIDagtjdxIBn8N_Fc")
	lat=google["results"][0]["geometry"]["location"]["lat"] 
	lng=google["results"][0]["geometry"]["location"]["lng"] 

	url = URI.encode("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lng}&distance=5000&client_id=8fe4db31e3a940068664c1e7e3c5c061
")

  instagram = HTTParty.get(url)

  instagram.response.body
end


get('/map') do 

	erb(:insta_with_map)
end


# api key flickr-b23cf7cab5194574519bf34270a9d842

# 13b7ded994d0cc2c


	# google=HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{city}+#{state}&sensor=false&key=AIzaSyBH66qMfXgrihEfE9HIDagtjdxIBn8N_Fc")
	# lat=google["results"][0]["geometry"]["bounds"]["northeast"]["lat"]
	# lng=google["results"][0]["geometry"]["bounds"]["northeast"]["lng"]
	# instagram["data"]["images"]["standard_resolution"]["url"]
