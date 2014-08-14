require 'socket'
require 'pry'
require 'uri'
 
server = TCPServer.new 2000

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
n = 0

while true
	client = server.accept
 	request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{path}"
 
  if path == "/movies"
  	client.puts "<h1>Movies</h1>"
    client.puts "<!DOCTYPE html><ol>"
    # binding.pry
	    while n < movie_db.length
	    	data_entry = "<a href='/movies/#{movie_db[n][:name]}'>#{movie_db[n][:name]}</a>"
			client.puts "<li>#{data_entry}</li>"
  			n += 1
  		end
  	client.puts "</ol>"

  elsif path.split('/')[1] == "movies" && path.split('/').length == 3
    name = URI.decode(path.split('/')[2])
      while n < movie_db.length
        if movie_db[n][:name] == name
          data =  "<!DOCTYPE html><h3>Title: #{movie_db[n][:name]}</h3>"
          data += "<p>Rating: #{movie_db[n][:rating]}</p>"
          data += "<p>Year: #{movie_db[n][:year]}</p>"
          data += "<p>IMDB: <a href='#{movie_db[n][:link]}'>link</a></p>"
          client.puts data
        end
      n += 1
      end
  
  else
      client.puts "<h1>This is a movie database, dammit! Don't bother me with your irrelevant inquiries.</h1>"
  end
  client.close
end