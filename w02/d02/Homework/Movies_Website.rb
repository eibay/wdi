### MovieDB!

require 'socket'
require 'uri'
require 'pry'

server = TCPServer.new 2000

while true
   ##connect
   client = server.accept
   puts 'the server is now running'

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

# #### A movies index page
# `/movies`

# The page should show a list of all the movies in the db and list them as follows with the name of the title and a link:
# ```html
# <ol>
#   <li><a href="/movies/The%20Shawshank%20Redemption">The Shawshank Redemption</a></li>
#   <!-- and so on..-->
# </ol>
# #we do it like this so when we want 
# #to see if the name == the name in the hash, it will match


# #### A page for each movie
# Given:
# `/movies/The%20Dark%20Night`

# The page should show the title, rating, the year it was made, and a link to the imdb.

##listen 
   request = client.gets.chomp #need this to have a reference to know what they're looking for
   puts "Client said: #{request}" 
   #this line above is basically just a server log of this point in the connection
   path = request.split(' ')[1] #this is to get the array of subpieces that make up the path
   #[1] is the main path of the page browser wants to load

## talk
  if path == "/movies"
      counter1 = 0
      client.puts "<html><h1>TOP MOVIES</h1></html>"
      client.puts "<ol>"
      while counter1 < movie_db.length
      client.puts "<li><a href='/movies/#{movie_db[counter1][:name]}'>#{movie_db[counter1][:name]}</a></li>"
      counter1 +=1
      end
      client.puts "</ol>"

   elsif path.split('/')[1]=="movies" && path.split('/')[2]
         #path.split('/') vs path.split(' ') give us data to look at in different ways
         #path.split(' ') gives us a '/'page and we need that to compare to the browser path
         #path.split('/') allows us to isolate the actual name of the subpage, so we can see
         #if that subpage name == to something else

      name = URI.decode(path.split('/')[2])
      counter2 = 0
         while counter2 < movie_db.length
            if movie_db[counter2].values.include?(name)
            client.puts "<p>#{movie_db[counter2][:name]} has a rating of #{movie_db[counter2][:rating]} 
            and was made in #{movie_db[counter2][:year]} 
            and the link is #{movie_db[counter2][:link]}</p>"
            end
         counter2 += 1
         end
   else
      client.puts "ERROR"
   end 

client.close
end  

