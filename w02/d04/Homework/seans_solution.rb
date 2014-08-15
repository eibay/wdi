#the search functionality in this api returns
#json that looks like this:
# {
# 	"Search" => [
# 		{
# 			"Title" => "movie1",
# 			"Year" => "1995",
# 			"imdbID" => "tt00303434"
# 		},
# 		{
# 			"Title" => "movie2",
# 			"Year" => "2003",
# 			"imdbID" => "tt00303434"
# 		}
# 	]
# }

#NOTE: this solution does not use html files

#these require statements are setup stuff
require 'socket'
require 'pry'
require 'json'


#create a server (just setup)
#but this line isn't the one
#that causes the server to actually
#start listening for a request
server = TCPServer.new 2000

#we have to have while true so that the
#program doesn't end after it handles
#the first request. What do you think
#might happen if we didn't have this?
while true

	#the server will literally stop on this next line
	#and won't continue reading the lines of code
	#until a client (like a browser, or even netcat) connects
	client = server.accept

	#we get to this line right after a client connects
	#and it reads just the first line of the request
	#that was sent to us from the browser (or in theory netcat)
	request = client.gets.chomp
	#the request looks like GET /search_term HTTP1.1
	#(search_term is the word that we will have the api
	#search movie titles for)
	#so we need to split it by the space character
	#and grab the second element to get moviename 
	path = request.split(' ')[1]

	#i'm keeping this simple, only handle paths that look
	#like /words/search_term. any other path I'm just like wat?
	if (path.include?("/words/"))
		#grab the search term from the path
		search_term = path.split('/').last
		#this message will go to the terminal
		puts "searching for movies with the word #{search_term}"

		#create a brand new connection to OMDB API
		api = TCPSocket.new 'www.omdbapi.com', 80
		#this puts goes to the server (not the terminal)
		#it will look like GET /?s=searchword
		api.puts 'GET /?s=' + search_term
		#when I do api.gets I am reading in the *response*
		#from the omdb remote server, which will be the
		#API response
		search_results = api.gets
		#hang up the phone to this remote server (thanks bye!)
		api.close

		#the search results from omdb are still in json
		#(which to ruby is just a long string)
		#but we need them to be in a ruby hash (otherwise
		#how would we access it's information)?
		results_in_json = JSON.parse(search_results)

		#we have to dig into the results to get what we want
		#refer to the top of this file for a visual
		movie_hashes = results_in_json["Search"]

		#we got the information from the movies, now lets
		#build up our html so that we can output it to the browser
		the_html = "<html><body>"
		the_html += "<ul>"
		#note that the_html is a string!! it is just a variable
		#that we are going to keep adding to that will eventually
		#be the entire html string that we send back to the browser

		#loop through each movie, because we want to list them all
		movie_hashes.each do |movie|
			#construct the url that will link to imdb
			link = "http://www.imdb.com/title/" + movie["imdbID"]
			#each movie will be just one line, lets use a template
			template = "<li><a href={{link}}>{{title}}</a>: {{year}}</li>"
			template = template.gsub("{{link}}", link)
			template = template.gsub("{{title}}", movie["Title"])
			template = template.gsub("{{year}}", movie["Year"])
			
			#ok we built a template but we actually don't have that
			#added to the main string we are building (the_html)
			#so lets add that guy
			the_html += template
		end

		the_html += "</ul>"
		the_html += "</body></html>"

		#this is the only line that actually outputs something
		#to the browser! every other line with html was just
		#building up the html string (that we output right here)
		client.puts the_html
	else
		#they requested some other page that we don't handle
		client.puts "wat?"
	end

	#hang up the phone. think about why we have to do this
	#inside the while loop ... because each iteration of the
	#while loop is run through each time a connection (phone call)
	#is made. for each connection (phone call) we need to hang up
	#so that we can make another one
	client.close
end

