require 'socket'
server = TCPServer.new 2000
require 'uri'
require 'pry'

movie_db = [ #this is 0 is array
  {
      name:"The Shawshank Redemption",
      rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   { #this is 1 in array
      name:"The Godfather",
      rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   {#this is 3 in array
      name:"The Godfather: Part II",
      rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   {#this is 4 in array
      name:"Pulp Fiction",
      rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   {#this is 5 in array
      name:"The Good, the Bad and the Ugly",
      rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   {#this is an array
      name:"The Dark Knight",
      rating:"8.9",
      rank:"6",
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
]
while true
	client = server.accept
	request = client.gets.chomp
	puts "Client said: #{client.gets}" #to put stuff in terminal to see whats going on
	path = request.split(" ")[1] #==["Get, "/movies/Inception, "HTTP"] and [1] is /movies/Inception so that is what path is
	path1 = path.split("/")      #==[" ", "movies", "Inception"]


counter = 0
counter1 = 0

if path == "/movies"
	client.puts "<html><ol>"
		while counter < movie_db.length
		 client.puts "<li><a href ='/movies/#{movie_db[counter][:name]}'>#{movie_db[counter][:name]}</a></li>"
		 counter += 1
		end
	client.puts "</ol></html>"
elsif path1[1]=="movies" && path1.length == 3
   client.puts "<html>"
 	name = URI.decode(path1[2]) #decoding the %20 in the movie name
 		while counter1 < movie_db.length
 			if movie_db[counter1].values.include?(name)
 		client.puts "<p>#{movie_db[counter1][:name]} has a rating of #{movie_db[counter1][:rating]} and was made in #{movie_db[counter1][:year]} and the link is <a href='#{movie_db[counter1][:link]}'> imbd </a></p>"
 	     end
 		counter1 += 1
 	end
   client.puts "</html>"
else
	client.puts "ERROR"
end 	
 	
client.close
end


#array is movie_db, [] is hash, [   ], and the key is a string
























