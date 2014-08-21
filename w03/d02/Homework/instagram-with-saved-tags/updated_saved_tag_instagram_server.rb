# code from Trish - to get the links active for each saved tag

# Saved search <li>s code: <li><a href="/tag?tag={{saved_search_item}}">{{saved_search_item}}</a></li>

# If/else part of my server.rb that contains links to saved searches: if request.path == "/" && request.request_method == "GET"


# saved_search_lis = []
# saved_searches.each do |search_item|
# search_li = File.read("./views/search_lis.html").gsub("{{saved_search_item}}", search_item)
# saved_search_lis << search_li
# end
# index = File.read("./views/index.html")
# if saved_searches.length > 0
# index = index.gsub("{{saved_search_lis}}", saved_search_lis.join(''))

# else
# index = index.gsub("{{saved_search_lis}}", "<li>No saved searches</li>")
# end



require 'webrick'
require 'socket'
require 'pry'
require 'httparty'


server = TCPServer.new 2000

saved_tags = []
# have to put it at the top, otherwise it will reset everytime - including when the server loops

loop do

	client = server.accept

# with webrick we don't need to do any of this:
	# request = client.gets #after the server picks up, this is the information we get, the first line

	# url = request.split(" ")[1] #same as what we were doing for path - taking the url and splitting it
	
	# params = parse_url(url) #doing the method on the new url we got and setting the variable to url

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	
# IN GENERAL - tools to pull data out of the WEBRICK request:

# request.path (this is the path)
# request.query (in POST/PUTS this is nil. in GETS this is where your search query is)
# request.header (first line has key info, rest we dont need yet)
# request.request_method (tells you the HTTP verb in yr request)
# request.body (this contains your query "puppy = sam")


	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html

	elsif request.path == "/styles.css" 
		# && request.request_method == "GET"
		# classmate says we don't need this line above because we're not getting any request from the browser for this - true?
		html = File.read("./views/index.html")
		client.puts html
	
	# THE CODE WORKED USING POST, PUT SINCE WE'RE GOING TO ROUTE THE USER BACK HERE IF THEY WANT TO RELOAD THE IMAGES CONNECTED TO A SAVED TAG, I WANT TO MAKE THIS A GETS. TO MAKE THIS WORK AS A GETS I NEED TO CHANGE WHERE THE SEARCH-TAG COMES FROM IN THE REQUEST

	# OLD
	# elsif request.path == "/tags" && request.request_method == "POST"
	# 	search_tag = request.body.split("=")[1]

	# NEW ATTEMPT
	elsif request.path == "/tags" && request.request_method == "GET"
		search_tag = request.query_string.split("=")[1]

# neels solution - is nesting the hash[key] in the api call to result in the value of what we're calling search_tag. i can't use this because i reference search_tag later

api_result = HTTParty.get("https://api.instagram.com/v1/tags/#{request.query["tag"]}/media/recent?client_id=267f9747893548ab86d79baff64cb209")


	# we send the search_tag to instagram using httparty

	instagram_response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")

	# then we create a structure to read and display instagrams response

	html = File.read('./views/tag_results.html')
		    html = html.gsub('{{search_tag}}', search_tag)

	images = []

	instagram_response["data"].each do |tag_instance|
			tag_record = File.read('./views/individual_tag.html')
			tag_record = tag_record.gsub('{{pic_url}}', tag_instance["images"]["standard_resolution"]["url"])
			tag_record = tag_record.gsub('{{width}}', tag_instance["images"]["standard_resolution"]["width"].to_s)
			tag_record = tag_record.gsub('{{height}}', tag_instance["images"]["standard_resolution"]["height"].to_s)
			tag_record = tag_record.gsub('{{filter}}', tag_instance["filter"])
		 	images.push(tag_record)
		end

	html = html.gsub('{{all_instagram_images}}', images.join(''))

	# STILL DON'T GET - why do we need to put this CSS gsub here? doesn't it just use our css from the earlier conditional by the root page?
	# if i keep it here, do i need to update the stylesheet path?

	html = html.gsub("{{css}}", '<link rel="stylesheet" type=text/css href="/style">')

	client.puts(html)


	# elsif request.path == "/saved_searches" && request.request_method == "POST"
	# PER JEFF - THIS IS A GET NOT A POST, THEY ARE NOT ADDING/UPDATING INFO
	elsif request.path == "/saved_searches" && request.request_method == "GET"
	
	# saved_tags = []
	# had here BUT needed to put it at the top-outside of ALL the loops, otherwise it will reset everytime - including when the server loops

	html = File.read('./views/saved_tags_display.html')

	# adding this because I think ruby's error said that i was trying to convert nil to a string (guessing nil is search_tag because that comes from a different elsif statement - it's not global to the program)

# this was OLD code from when I made the search a POST instead of a request
# 	search_tag = request.body.split("=")[1]

# this is NEW code because I changed from POST to GET

	search_tag = request.query_string.split("=")[1]

		unless saved_tags.include?(search_tag)
			tag_record = File.read('./views/single_saved_tag_formatting.html')
			tag_record = tag_record.gsub('{{unique_tag}}', search_tag)
			saved_tags.push(search_tag)
		end

	html = html.gsub('{{saved_tags}}', saved_tags.join(''))

	html = html.gsub("{{css}}", '<link rel="stylesheet" type=text/css href="/style">')

	client.puts(html)


	else client.puts "Error"
		 puts "Error"

end

client.close

end