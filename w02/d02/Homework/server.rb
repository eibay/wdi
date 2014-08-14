require 'socket'
require 'pry'
require 'uri'
 
server = TCPServer.new 2000
 
# / -> Index h1
# /hello -> Hello! h1
# /hello/acceptablenames -> <h1>Hello, Name!</h1>
# monkey, severus, peter parker
# Woah - we do not know you.

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
    while counter < movie_db.length
      movie_title = movie_db[counter][:name]
      client.puts 
      "<ol>
        <li><a href='/movies/#{movie_title}'>#{movie_title}</a></li></ol>"

      # counter += 1
    end
  end

  # binding.pry

  # client.puts "<a href="/movies/movie_db[0][:name]">#{movie_title}</a>"
  # elsif path == "/"
  #   client.puts "<h1>index</h1>"
  # elsif path.split('/')[1] == "hello" && path.split('/').length == 3
  #   name = URI.decode(path.split('/')[2])
  #   if people.keys.include?(name)
  #     our_output =  "<h1>Hello, #{name.capitalize}</h1>"
  #     our_output = our_output + "<p>Who lives in #{people[name][:location]}</p>"
  #     our_output = our_output + "<p>And likes to eat #{people[name][:flavor]}</p>"
  #     #html += "<p>Who lives in #{people[name][:location]}</p>"

  #     client.puts our_output
  #   else
  #     client.puts "<h1>WOAH! We don't know you...</h1>"
  #   end
  # else
  #   client.puts "NOT FOUND"
  # end
 
  # disconnect
  client.close
end