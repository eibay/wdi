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

while true
  # connect
  client = server.accept
 
  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"
 
  # talk
   if path == "/movies"

      counter = 0

      client.puts "<!Doctype html>"

      client.puts "<ol>"

      while counter < movie_db.length
      
         client.puts "<li><a href = '#{movie_db[counter][:name]}'>#{movie_db[counter][:name]}</a></li>"
         
         counter += 1
      end
      client.puts "</ol>"

   # path == /movies/moviename

   # elsif path.split('/')[1] == "hello" && path.split('/').length == 3
   #    name = URI.decode(path.split('/')[2])
   end
   # if movie_db.keys.include?(name)
   #    our_output =  "<h1>#{name.capitalize}</h1>"
   #    our_output = our_output + "<p> Title: #{movie_db[name][:name]} </p>"
   #    our_output = our_output + "<p> Rating: #{movie_db[name][:rating]} </p>"
   #    our_output = our_output + "<p> Year: #{movie_db[name][:year]} </p>"
   #    our_output = our_output + "<p> Link: #{movie_db[name][:link]} </p>"
      
   #    client.puts our_output
   # end

   # else
   #    client.puts "NOT FOUND"
   # end
 
  # disconnect
  client.close
end
   







# if path == "/movies"
#    name = path.split('/')[1]
#    # name = name.split('%20').join(' ')
#    client.puts "<html><ol><li>#{}{name}</li></ol></html>"   
# end





