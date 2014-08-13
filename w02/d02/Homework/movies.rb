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
   request = client.gets.chomp
   path = request.split(" ")[1]
   index = 0



   if path == "/movies"

      client.puts "<h1>Top movies in IMDB</h1>"




      while index < movie_db.length

         title = movie_db[index][:name]
         link = movie_db[index][:link]
         rating = movie_db[index][:rating]
         year = movie_db[index][:year]
         uri_title = URI.encode(title)
         client.puts "<html> <ol><ul> <li>#{title}</li> <li><a href=#{link}>IMDB link</a></li> </ul></html> </ol>"

         index +=1
      end

# binding.pry

   elsif path == "/movies/#{title}"
      title = URI.decode(title)
      if title.include?(title)
      client.puts "<h1>Welcome to #{movie_db[title][:name]}</h1>"
   end
end


   # name:"The Shawshank Redemption",
   #    rating:"9.2",
   #    rank:"1",
   #    link:"http://www.imdb.com/title/tt0111161/",
      #year:"1994"

# Disconnect

client.close

end




























