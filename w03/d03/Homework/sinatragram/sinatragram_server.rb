# parts to the program:

# update the server
	# add correct "paths"
	# get the correct data collected
# updated the .erb sheets



require 'sinatra'


# old non-sinatra code:

# if request.path == "/" && request.request_method == "GET"
# 		html = File.read("./views/index.html")
# 		client.puts html

get("/") do
  erb(:index)
end

# old non-sinatra code:
# elsif request.path == "/tags" && request.request_method == "POST"
# 		search_tag = request.body.split("=")[1]


# the class example of sinatra code
# # request.params = our key

# get("/name") do
#   name = request.params["first_name"]
#  # the line below SENDS THE VALUE NAME INTO THE NAME ERB FILE
#   erb(:name, { locals: { name: name } })
# end

# QUESTION - WHAT DOES { name: name } DO?

get("/tags") do
  	search_tag = request.params["specific_word"]
 # the line below SENDS THE VALUE NAME INTO THE NAME ERB FILE
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
  	erb(:name, { locals: { name: specific_tag, search_tag: search_tag, response: response } })
end

# don't know which of these I'm supposed to keep in here, or both? 
# response: response: response, name: specific_tag, search_tag: search_tag, images: images.join

# also if we do a form and their are multiple name fields, which thing do we call name? or, is it that the name we give it becomes the key? (i think it's the latter, but not sure)


get("/location") do
	lat = request.params["latitude"].to_f
	lon = request.params["longitude"].to_f
	
	response1 = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{lat}&lng=#{lon}&client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	erb(:location, {locals: {response1: response1}})
end
