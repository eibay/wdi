require 'webrick'
require 'pry'
require 'httparty'

server = TCPServer.new 2000
saved_searches = []

loop do 

# GET '/' === home page
# GET 'styles.css' === 
# GET 'search' === photo_page, with button form
# GET '/saved_searches' === list of saved searches
# form 1 has method GET? because it makes a new HTTP request for action, info, and page
# form 2 is meant to save the information, so POST (path /save_me)
# when user pushes button, it's a http request at that time
# href is always a GET
# request.query

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/query_form.html")
		client.puts html
		puts "Sent query_form to client"

	elsif request.path == "/stylesheets/instastyle.css"
		client.puts File.read('./stylesheets/instastyle.css')
		puts "Sent css to client"

	# if POST is from index search form
	elsif request.path == "/" && request.request_method == "POST"
		search_term = request.body.split("=")[1]
		
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_term}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
		puts "Sent request to instagram"

			photo_array = []
			# looking for photo urls in the big hash
			response["data"].each do |pic|
			photo_url = pic["images"]["standard_resolution"]["url"]
			# push each photo into this array
			photo_array << "<img src='#{photo_url}'>"
			end

		html = File.read("./views/photo_page.html")
		html = html.gsub("{{search_term}}", search_term)
		html = html.gsub("{{photos}}", photo_array.join(''))
		client.puts html
		puts "Sent photo_page to client"


	# if POST is result of Save Search button
	elsif request.path == "/save_me" && request.request_method == "POST"
		search_term = request.body.split("=")[1]
		# there should be an unless test here so we don't save the same term twice
# ******** these list items need to be links to {search_term} photo_page
# ******** or they need to be links that cause the whole instagram search thing to happen again
		saved_searches << "<li><a href='/save_me/#{search_term}'>#{search_term}</a></li>"
		puts "added to saved_searches array"
		# construct and display list of saved links
		html = File.read("./views/show_saved.html")
		html = html.gsub("{{saved_searches}}", saved_searches.join(''))
		client.puts html
		puts "Sent show_saved to client"

#if POST is result of click of link in list
	elsif request.path == "/save_me/#{search_term}" && request.request_method == "POST"
		search_term = request.body.split("=")[1]
client.puts "You're on the right track"

	else
		client.puts "I'm lost...or you are."
	end
	
client.close	
end