require 'socket'
require 'URI'

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

client = server.accept
request = client.gets.chomp
path = request.split(" ")[1]
index = 0
num = 1





while true


   if path == "/movies"
      client.puts "<h1> imdb's top 6 movies </h1>"
   end

   while index < movie_db.length do
      name = movie_db[index][:name]
      rating = movie_db[index][:rating]
      rank = movie_db[index][:rank]
      link = movie_db[index][:link]
      year = movie_db[index][:year]

      uri_title = URI.encode(name)

      if path == "/movies"
         
         client.puts "<li> <a href='movies/#{uri_title}>#{name} </a></li>"
         

      elsif path == "/movies/#{uri_title}"
         client.puts "<ul>"
         client.puts "<li>#{name}</li> <li>#{rating}</li> <li>#{rank}</li> <li>#{link}</li> <li>#{year}</li>"
         client.puts "</ul>"

      end
      index += 1
   end
   
client.close
end

""
" "

movie_db.index("The Matrix") X

movie_db[0].key("The Matrix")





