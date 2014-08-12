require 'socket'
server = TCPServer.new 2000
require 'uri'
require 'pry'

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
while true
	client = server.accept
	request = client.gets.chomp
	puts "Client said: #{client.gets}"
	path = request.split(" ")[1]
	path1 = path.split("/")[1]


counter = 0
counter1 = 0

if path == "/movies"
	client.puts "<html> <body> <ol>"
		while counter < movie_db.length
		client.puts "<li><a href ='/movies/#{movie_db[counter][:name]}'>#{movie_db[counter][:name]}</a></li>"
		counter += 1
		end
	client.puts "</html> </body> </ol>"
 elsif path.split('/')[1]=="movies" && path.split('/')[2]
   client.puts "<html><body>"
 	name = URI.decode(path.split('/')[2])
 		while counter1 < movie_db.length
 			if movie_db[counter1].values.include?(name)
 		client.puts "<p>#{movie_db[counter1][:name]} has a rating of #{movie_db[counter1][:rating]} and was made in #{movie_db[counter1][:year]} and the link is <a href '#{movie_db[counter1][:link]}'> imbd </a></p>"
 	end
 		counter1 += 1
 	end
   client.puts "</html></body>"
else
	client.puts "ERROR"
end 	
 	
client.close
end



























