require 'socket'
require 'pry'
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

while true
	client = server.accept
	request = client.gets.chomp
	puts "Client: #{request} #{Time.now}"
	path = request.split(" ")[1]
	movie = path.split("/")[2]
	

	def html(title, list)
		array = list.find {|x| x[:name] == URI.decode(title)}
		index = list.index(array) 
		"<p><strong>Title:</strong> <em>#{list[index][:name]}</em><br />
		<strong>Rating:</strong> <em>#{list[index][:rating]}</em><br />
		<strong>Year:</strong> <em>#{list[index][:year]}</em><br />
		<strong>IMDB:</strong> <em><a href='#{list[index][:link]}'>#{list[index][:name]}</a></em></p>"
	end

	movies_uri = movie_db.map {|movie| movie[:name]}
	links = movies_uri.map {|movie| "<li><a href='/movies/#{movie}'>#{URI.decode(movie)}</a></li>"}
	
	if path == "/movies"
		client.puts "<html><body><ol>"
		client.puts links
		client.puts "</ol></body></html>"
	elsif path == "/movies/#{movie}"
		client.puts html(movie, movie_db)
	end
end	

