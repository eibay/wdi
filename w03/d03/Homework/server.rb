require 'sinatra'
require 'httparty'
require 'pry'

image_gallery = []

get("/") do
	erb(:index)
end




get("/search") do
	searched_tag = request.params["tag"] # GET USERS INPUT -- /search?tag=octopus ---> octopus
	# p "REQUEST.PARAMS['TAG']: #{request.params["tag"]}"


	response = HTTParty.get("https://api.instagram.com/v1/tags/#{searched_tag}/media/recent?client_id=f9f86dbac5d7478c8e325fb20ea506b1")
	# example:  HTTParty.get("https://api.instagram.com/v1/tags/octopus/media/recent?access_token=23131423.f59def8.a6672ba008ba4698bf9255c69b886261")
	response

	# response["data"].each do |x|
	# 	images = "<img src='#{x["images"]["low_resolution"][]}'/>"
	# 	image_gallery << images
	# end



	erb(:search, { locals: { image_gallery: response }})


end



get("/locate") do
	# erb(:locate)
	lat = request.params["lat"]
	# p "request.param['lat'] = #{lat}"
	long = request.params["long"]
	# p "request.param['long'] = #{lat}"
	searched_lat_long = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=f9f86dbac5d7478c8e325fb20ea506b1")
	search_info = "results for coordinates #{lat} Latitude & #{long} Longtitude"
	# searched_lat_long = HTTParty.get("https://api.instagram.com/v1/media/search?lat=40&lng=74&client_id=f9f86dbac5d7478c8e325fb20ea506b1")
	# location_data = searched_lat_long["data"]
	# searched_lat_long
	# p 'STUFF = searched_lat_long["data"][0][images"]["low_resolution"]["url"]'
	erb(:locate, { locals: { locate_this: searched_lat_long, show_search_info: search_info }})

end
 

# get("/locate") do
# 	# erb(:locate)
# 	lat = request.params["lat"]
# 	# p "request.param['lat'] = #{lat}"
# 	long = request.params["long"]
# 	# p "request.param['long'] = #{lat}"
# 	searched_lat_long = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{long}&client_id=f9f86dbac5d7478c8e325fb20ea506b1")
# 	# binding.pry
# 	# searched_lat_long = HTTParty.get("https://api.instagram.com/v1/media/search?lat=40&lng=74&client_id=f9f86dbac5d7478c8e325fb20ea506b1")
# 	# location_data = searched_lat_long["data"]
# 	# searched_lat_long
# 	# p 'STUFF = searched_lat_long["data"][0][images"]["low_resolution"]["url"]'
# 	erb(:locate, { locals: { locate_this: searched_lat_long }})
# end



# Sinatragram!

# Implement a Sinatra web application with the following:

# A home page with a search form. The user can enter an instagram tag and search.
# After the user clicks search, they can see a list of images from instagram with the searched for tag.
# BONUS:

# Another search form on the home page that takes a latitude and longitude. Takes the user to a page that shows all of the images close to that lat/long.
# Instead of lat/long, the user types in a city/state. Find out how to convert a city/state into lat long and use that to search instagram.








