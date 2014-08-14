require 'socket'
require 'pry'
require 'URI'
server = TCPServer.new 4000






movie_db = {
  
      "The Shawshank Redemption" =>
      {rating:"9.2",
      rank:"1",
      link:"http://www.imdb.com/title/tt0111161/",
      year:"1994"},
 
     "The Godfather" =>
      {rating:"9.2",
      rank:"2",
      link:"http://www.imdb.com/title/tt0068646/",
      year:"1972"},

      "The Godfather: Part II" => 
      {rating:"9.0",
      rank:"3",
      link:"http://www.imdb.com/title/tt0071562/",
      year:"1974"},
  
      "Pulp Fiction" =>
      {rating:"8.9",
      rank:"4",
      link:"http://www.imdb.com/title/tt0110912/",
      year:"1994"},
   
      "The Good, the Bad and the Ugly" =>
      {rating:"8.9",
      rank:"5",
      link:"http://www.imdb.com/title/tt0060196/",
      year:"1966"},
   	
   	  "The Dark Knight" =>
      {rating:"8.9",
      rank:"6",
      link: "http://www.imdb.com/title/tt0468569/",
      year:"2008"
   },
}


while true
	client = server.accept

	request = client.gets.chomp

	path = request.split(' ')[1]
	
   binding.pry
	movie = URI.decode(path.split('s/')[1])

	puts "Client said: #{request}"

	if movie_db.keys.include?(movie)
		html = "<h1> #{movie.upcase}</h1>"
		html += "<p> The rating of #{movie} is #{movie_db[movie][:rating]}</p>"
		html += "<p> #{movie} was made in the year #{movie_db[movie][:year]}</p>"
		html += "<p> To find out more about #{movie} go to #{movie_db[movie][:link]}</p>"
	 	client.puts html
	else 
		client.puts "woah- we do not know you!"
	end

movietwo = URI.decode(path.split('s/')[0])


	if path == movietwo
		client.puts"STUPID"
	end
	client.close

end



