require 'pry'
require 'socket'
require 'uri'

#PATH-BASED PARAMETER
server = TCPServer.new 2000
while true
	#connect
	client = server.accept
	client_ip = client.remote_address.ip_address
	request = client.gets.chomp
	puts request

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
		i = 0
		t = 0
	path = request.split(" ")[1]
	#puts path
	

      client.puts "<html>"
	if path == '/'
		client.puts "Please be more specific about what you want."
	elsif path == '/movies'
		#	<!DOCTYPE html>
		client.puts	"<ol>"
			while i < movie_db.length
			client.puts "<li><a href='/movies/#{movie_db[i][:name]}'>#{movie_db[i][:name]}</a></li>"
			i += 1
			end
		client.puts	"</ol>"

		elsif path.split("/")[1] == "movies" && path.split("/")[2]
			title = URI.decode(path.split("/")[2])
				while t < movie_db.length
				#client.puts title
					if movie_db[t][:name] == title
						client.puts "#{movie_db[t][:name]}<br>"
						#client.puts rating
						client.puts "The movie is rated #{movie_db[t][:rating]}<br>"
						#client.puts year
						client.puts "The movie was made in #{movie_db[t][:year]}<br>"
            #client.puts link to imdb
            client.puts "Find out more at <a href='#{movie_db[t][:link]}'>#{movie_db[t][:name]}</a>"
					end
				t += 1
				end				

				#client.puts "<a href=''>"
		end



	#disconnect
	client.close
end