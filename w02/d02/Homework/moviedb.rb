   # path.split("/")"
   # [0] "",
   # [1] "movies"

#[] array
#{} hash

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

require 'socket'
server = TCPServer.new 2000
require 'uri'
require 'pry'

while true
   client = server.accept
   request = client.gets.chomp
   puts "Client said: #{request}"
   path = request.split(" ")[1]


index = 0

if path == "/movies"
   client.puts "<h1> Top 6 Movies of ALL TIME. </h1>"
   
   client.puts "<!doctype html> <body> <ol>"
      
      while index < movie_db.length
      client.puts "<li> <a href ='/movies/#{movie_db[index][:name]}'> #{movie_db[index][:name]} </a></li>"
      index += 1
      end                 
   
   client.puts "<!doctype /html> </body> </ol>"

elsif path == "/"
   client.puts "<h1> Welcome to Honest Movie Reviews! </h1>"
   client.puts "<h3>....no bullshit, just honest reviews.</h3>"
   client.puts "<p> <a href='/movies'> Click here to see our top 6! </a> </p>"

 elsif path.split('/')[1]=="movies" && path.split('/')[2]
   name = URI.decode(path.split('/')[2])
    
index2 = 0

while index2 < movie_db.length
      if movie_db[index2].values.include?(name)
      client.puts "<p>#{movie_db[index2][:name]} #{movie_db[index2][:rating]} #{movie_db[index2][:rank]} #{movie_db[index2][:link]} #{movie_db[index2][:year]} </p>"
      binding.pry
      end
      index2 += 1
end

else
   client.puts "ERROR"
end   
   
client.close
end
