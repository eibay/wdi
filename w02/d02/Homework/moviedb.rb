# require 'pry'
#To seach for error in real time by placing "binding.pry" in the code.
require 'socket'
require 'uri'
#To take out uri code in place of spaces when converting to path

server = TCPServer.new 2000

while true
	client = server.accept

	

# Hash in an Array
movie_db = [
  {
      name:"The Shawshank Redemption",
      rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   {
      name:"The Godfather",
      rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   {
      name:"The Godfather: Part II",
      rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   {
      name:"Pulp Fiction",
      rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   {
      name:"The Good, the Bad and the Ugly",
      rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   {
      name:"The Dark Knight",
      rating:"8.9",
      rank:"6",
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
]

	request = client.gets.chomp
	puts "Client said: #{request}"
	path = request.split(' ')[1]
	#splits the path by inserting space of path and extracting the second value

	if path == "/movies"

		counter1 = 0
		#starts a counter of the movie at 0 from the array
		client.puts "<!Doctype html>"
		#tells browser to start html
		client.puts "<ol>"
		#order list (i.e., 1, 2, 3, 4, a,b,c)
		while counter1 < movie_db.length
		#starts while loop.  While counter1 is less than the whole movie_db
			client.puts "<li><a href ='/movies/#{movie_db[counter1][:name]}'>#{movie_db[counter1][:name]}</a></li>"
			#puts counting down a list of /movies/"name of movie" - anchored by the link to the page
			Counter1 += 1
			#adds 1 each time it loops until it's less than the movie_db
		end
	client.puts "</ol>"
	#Closed ordered list tag

end

end
