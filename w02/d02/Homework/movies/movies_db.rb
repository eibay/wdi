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
   client = server.accept

 if path == "/movies_db"
    client.puts "<h1>HELLO! #{current_time}</h1>"
  elsif path == "/"
    client.puts "<h1>movies</h1>"
  elsif path.split('/')[1] == "hello" && path.split('/').length == 3
    name = URI.decode(path.split('/')[2])
  else
    client.puts "NOT FOUND"
  end

  if people.keys.include?(name)
      our_output =  "<h1>Hello, #{name.capitalize}</h1>"
      our_output = our_output + "<p> #{people[name][:location]}</p>"
      our_output = our_output + "<p>You really enjoy #{people[name][:flavor]} flavored ice cream!</p>"
      client.puts our_output
   end

  # disconnect
  client.close
end