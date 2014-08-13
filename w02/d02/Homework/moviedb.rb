# # movie_name = []
# # movie_rating = []
# # movie_rank = []
# # movie_link = []
# # movie_year = []

#    # [0] "The Shawshank Redemption",
#    #  [1] "The Godfather",
#    #  [2] "The Godfather: Part II",
#    #  [3] "Pulp Fiction",
#    #  [4] "The Good, the Bad and the Ugly",
#    #  [5] "The Dark Knight"
   
#    # [0] "9.2",
#    #  [1] "9.2",
#    #  [2] "9.0",
#    #  [3] "8.9",
#    #  [4] "8.9",
#    #  [5] "8.9"
   
#    #  [0] "1",
#    #  [1] "2",
#    #  [2] "3",
#    #  [3] "4",
#    #  [4] "5",
#    #  [5] "6"

#    # [0] "http://www.imdb.com/title/tt0111161/",
#    #  [1] "http://www.imdb.com/title/tt0068646/",
#    #  [2] "http://www.imdb.com/title/tt0071562/",
#    #  [3] "http://www.imdb.com/title/tt0110912/",
#    #  [4] "http://www.imdb.com/title/tt0060196/",
#    #  [5] "http://www.imdb.com/title/tt0468569/"


#    #  [0] "1994",
#    #  [1] "1972",
#    #  [2] "1974",
#    #  [3] "1994",
#    #  [4] "1966",
#    #  [5] "2008"

# path.split("/")"
   # [0] "",
   # [1] "movies"

require 'socket'
server = TCPServer.new 2000
require 'uri'
require 'pry'

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
   puts "Client said: #{client.gets}"
   path = request.split(" ")[1]
# binding.pry

index = 0
index2 = 0

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
      
   while index2 < movie_db[index2].length
         if movie_db[index2].values.include?(name)

      client.puts "<p>#{movie_db[index2][:name]} {movie_db[index2][:rating]} {movie_db[index2][:rank]} <p>#{movie_db[index2][:link]} <p>#{movie_db[index2][:year]} </p>"
   index += 1
# part two doesn't really work.
   end

# client.puts output_name
# client.puts output_rating
# client.puts output_rank
# client.puts output_link
# client.puts output_year
end

else
   client.puts "ERROR"
end   
   
client.close
end
