require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000

movie_db = {
  "The Shawshank Redemption" => {
      rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"
   },
   "The Godfather" => {
      rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"
   },
   "The Godfather: Part II" => {
      rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"
   },
   "Pulp Fiction" => {
      rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"
   },
   "The Good, the Bad and the Ugly" => {
      rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"
   },
   "The Dark Knight" => {
      rating:"8.9",
      rank:"6",
      link:"http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
}

while true
  # connect
  client = server.accept
 
  # listen - or get input
  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "Client said: #{request}"
 
  # talk
   if path == "/movies"
      #my problem is below. i am not calling the movies the right way.
      client.puts "<html><ol><li> #{movie_db[0]} </li></ol></html>"
   elsif path.split('/')[1] == "hello" && path.split('/').length == 3
      name = URI.decode(path.split('/')[2])
    
   if movie_db.keys.include?(name)
      our_output =  "<h1>#{name.capitalize}</h1>"
      our_output = our_output + "<p> Title: #{movie_db[name][:location]} </p>"
      our_output = our_output + "<p> Rating: #{movie_db[name][:flavor]} </p>"
      our_output = our_output + "<p> Year: #{movie_db[name][:flavor]} </p>"
      our_output = our_output + "<p> Link: #{movie_db[name][:flavor]} </p>"
      
      client.puts our_output
   end

   else
      client.puts "NOT FOUND"
   end
 
  # disconnect
  client.close
end
   







# if path == "/movies"
#    name = path.split('/')[1]
#    # name = name.split('%20').join(' ')
#    client.puts "<html><ol><li>#{}{name}</li></ol></html>"   
# end





