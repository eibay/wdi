require "socket"
require "uri"
require "pry"
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
	path = request.split(' ')[1]
	puts "Client said #{request}"


	movie_titles = []
	x=0
	while x < movie_db.length 
		movie_titles[x] = movie_db[x][:name]		
		x += 1
	end

	if path == "/movies"
	movie_titles.each { |t|
		client.puts "<!doctype html> #{movie_titles.index(t)+1}. "
		client.puts "<a href='#{path}/#{t}'>#{t}</a><br>" 
	}
	
	elsif path.split('/')[1] == "movies" && path.split('/').length == 3
		specific_movie = URI.decode(path.split('/')[2])
		
		if movie_titles.include?(specific_movie) == true
		number = movie_titles.index(specific_movie)

		client.puts "<h1>#{specific_movie}</h1> <br>#{specific_movie} was made in #{movie_db[number.to_i][:year]} and is rated #{movie_db[number.to_i][:rating]} out of 10. Here is a <a href = '#{movie_db[number.to_i][:link]}'>link</a> for more information on #{specific_movie}   "
		end

	else
		client.puts "Sorry, I can only tell you about these movies: #{movie_titles}"
	end
	client.close
end

		