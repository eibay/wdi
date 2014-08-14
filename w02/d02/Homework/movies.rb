require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000


while true

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

   client = server.accept
   request = client.gets.chomp
   path = request.split(" ")[1]
   index = 0
   num = 1

   if path == "/movies"
      client.puts "<html><h1>IMDb's Top 6 Movies</h1></html>"
   end

   while index < movie_db.length

      title = movie_db[index][:name]
      link = movie_db[index][:link]
      rating = movie_db[index][:rating]
      year = movie_db[index][:year]
      uri_title = URI.encode(title)
      
      if path == "/movies"
         client.puts "<h2>##{num}</h2>"
         client.puts "<ol>"
         client.puts "<ul><li><a href=/movies/#{uri_title}>#{title}</a></li> <li><a href=#{link}>IMDb link</a></li></ul>" 
         client.puts"</ol>"

      elsif path == "/movies/#{uri_title}"
         client.puts "<html><ul>"
         client.puts "<li>#{title}</li> <li>Rating: #{rating}</li> <li>Year: #{year}</li> <li><a href=#{link}>IMDb - #{title}</a></li>"
         client.puts "</ul></html>"
      end

      index +=1
      num += 1
   end

   client.close
end




























