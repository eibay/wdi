require 'socket'
require 'pry'
require 'URI'

server = TCPServer.new 2000

while true
	client = server.accept
   client_ip = client.remote_address.ip_address 

   puts "Client has connected from #{client_ip}"

	request = client.gets.chomp
	path = request.split[1]


#movie_db.each {|x, y| puts "#{x}-----puts "#{y}}
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
   # binding.pry

if path == "/movie"
   
	client.puts "<!doctype html><h1>Yet Another Movie Database!</h1><hr>"
	client.puts "Top movies are:<br />"
   puts "Serving the index page to #{client_ip}"
   index = 0
	while index < movie_db.length
      movie_name = movie_db[index][:name]
      # movie = URI.decode(path.split("/")[2])
      # if path == "/movie/#{URI.decode(movie_name)}"
      client.puts "<ol>"
      client.puts "<li><a href='/movie/#{movie_name}'>#{movie_db[index][:name]}</a></li><br >"
      index += 1 
      client.puts "</ol></html>"
   end

elsif path.split('/')[1] == "movie" && path.split('/').length == 3   
   movie = URI.decode(path.split("/")[2])
   # binding.pry
   movie_name = movie
   binding.pry
   client.puts "<!doctype html>#{movie}"
   client.puts "<hr />"
   client.puts "#{movie_db[movie_db.index(movie)]}"
   puts "Serving the movie page to #{client_ip}"
 # binding.pry
 client.puts "</html>"
end
#movie = URI.decode(path.split("/")[2])
# elsif path == "/movie/#{path.split("/")[2]}"
#    client.puts "#{movie_db[index][:name]}"
#    puts "Serving the movie page to #{client_ip}"
# else
#    client.puts "lame."
#    puts "Serving the error page to #{client_ip}"

   client.close
end



