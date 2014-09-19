require 'sinatra'
require 'sinatra/reloader'
require 'HTTParty'
require 'JSON'
require 'pry'

get("/") do 
	erb(:index)
end

get("/api/:path") do
	path = params[:path]
	location = path.gsub(" ", "+")
	googresponse = HTTParty.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{location}&key=AIzaSyCUDbbdZqgnvYm0LmOJAXlm_lJKTOERRYg")

	lat = googresponse["results"][0]["geometry"]["location"]["lat"]
	long = googresponse["results"][0]["geometry"]["location"]["lng"]

	response = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=3d38625797044213864a484fd7c85db7")
	picArr=[]
	response["data"].each do |x|
		picArr<<x["images"]["standard_resolution"]["url"]
	end
	return picArr.to_json

end
