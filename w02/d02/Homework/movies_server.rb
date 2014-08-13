require 'pry'
require 'socket'
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



loop do

	lead = "<head><style>
a:link {text-decoration: none; color: #FFDE6A;}
a:visited {text-decoration: none; color: #E86C0C;}
</style></head>"

	client = server.accept

	request = client.gets

	path = request.split(" ")[1]
	puts = "Client has requested #{path}"

	if path == "/movies"
		client.puts "#{lead}<body><ol>"
		movie_db.each do |hash|
			client.puts"<li><button><a href=\"/movies/#{hash[:name]}\">#{hash[:name]}</a></button></li>"
		end
		client.puts "</ol></body>"
		puts "Sent Client /movies"

	elsif path.split("/").length == 3 && path.split("/")[1] == "movies"
		movie = URI.decode(path.split("/")[2])
		movie_db.each do |hash|
			if movie == hash[:name]
				client.puts "#{lead}
				<p>#{movie} was released in #{hash[:year]}.<p>
				<p>This movie was rated #{hash[:rating]} by IMDB.</p>
				<p>It is ranked #{hash[:rank]} out of all movies.</p>
				<p><a href=\"#{hash[:link]}\">IMDB</a></p>
				<p><a href=\"/movies\">HOME</a></p>"
			end
		end
		puts "Sent Client /movies/#{movie}"

	else
		client.puts "NOT FOUND"
		puts "Client requested #{path}"
	end
# binding.pry

	client.close


end

