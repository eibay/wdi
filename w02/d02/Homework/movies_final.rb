require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000


while true #used to loop through the program

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

   client = server.accept #hey server im the client/user/browser get ready to accept some stuff from me
   request = client.gets.chomp #hey im the request being sent by the client/user/browser and i want u to get that n remove extra whitespace stuff
   path = request.split(" ")[1] #Im the main event yo, I navigate them waters n make sure u get the right page when u want it
   index = 0 #bread n butter of a while loop, setting the counter
   num = 1 #extra

   if path == "/movies" #if this n ONLY this is after port which is 2000 in this case gime the below html top 6 stuff.
      client.puts "<html><h1>IMDb's Top 6 Movies</h1></html>"
   end

   while index < movie_db.length # index is 0 and our array of hashes above obv is not
      #Below r examples of variables that r semantic n r related to our hash where they set to each individual
      #index of our hash key/value pairs so the variables can be utilized further down the program by means of interpolation.

      title = movie_db[index][:name] #Shawshank redemption, dark night etc etc.
      link = movie_db[index][:link] #link to the imdb page of shawshank, dark night etc etc.
      rating = movie_db[index][:rating] #rating for movies
      year = movie_db[index][:year] #year of movies
      uri_title = URI.encode(title) #variable for utilizing the require uri library being used to decode annoying clingy %20 characters in path.

      if path == "/movies" #while our index is less than our data structure above and if the path is
         #equal to movies and only movies
         client.puts "<html><h2>##{num}</h2></html>" #Gime that number
         client.puts "<ol>" #open up an ordered list, 1, 2, etc
         client.puts "<ul><li><a href=/movies/#{uri_title}>#{title}</a></li> <li><a href=#{link}>IMDb link</a></li></ul>"
         #open up an unordered list(bullet pts), list em out with links that are from the path of movies which are decoded bc of uri_title
         #Put the title of those said moves there, list em out and create an external link to get their info on imdb
         client.puts"</ol>" #close ordered list. Note- ordered list has nested unordered list.

      elsif path == "/movies/#{uri_title}" #now if the path in the browser is movies AND the DECODED TITLE of shawshank, dark night etc, GO TO THAT PATH AND
         client.puts "<html><ul>" #put em in an unordered list
         client.puts "<li>#{title}</li> <li>Rating: #{rating}</li> <li>Year: #{year}</li> <li><a href=#{link}>IMDb - #{title}</a></li>"
         #list out the title, rating, year and again like above provide a link to their imdb info n movie page.
         client.puts "</ul></html>" #close unordered list
      end

      index +=1 #increments the loop to go through our fancy data structure of the movies
      num += 1 #increments the number associated with each movie, #1, #2, etc.
   end

   client.close #disconnects
end #ends the loop




























