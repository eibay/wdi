require 'socket'
require 'uri'
require 'pry'

server= TCPServer.new 2000

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

	

	if path == "/movies"

		index = 0
		movie_list = []
		
		while index < movie_db.length
			movie_list << "#{movie_db[index][:name]}"
			index +=1
		end
		client.puts "<h1>Movies</h1>"

		
		# index = 0
		# movie_link = URI..movie_list[index][:name]

		# while index < movie_list.length
		# 	client.puts "<html><ol>
		# 					<li><a href='/movies/#{movie_link}'>#{movie_list[index]}</a></li>
		# 					</ol>"
		# 	inex += 1				
		# end



		client.puts "<html><ol>"
				client.puts "<li><a href='/movies/The%20Shawshank%20Redemption'>#{movie_list[0]}</a></li>"
				client.puts "<li><a href='/movies/The%20Godfather'>#{movie_list[1]}</a></li>"
				client.puts "<li><a href='/movies/The%20Godfather:%20Part%20II'>#{movie_list[2]}</a></li>"
				client.puts "<li><a href='/movies/Pulp%20Fiction'>#{movie_list[3]}</a></li>"
				client.puts "<li><a href='/movies/The%20Good,%20the%20Bad%20and%20the%20Ugly'>#{movie_list[4]}</a></li>"
				client.puts "<li><a href='/movies/The%20Dark%20Knight'>#{movie_list[5]}</a></li>"
		client.puts "</ol>"

		# client.puts "<html><ol>"
		# 		client.puts "<li><a href='/movies/The%20Shawshank%20Redemption'>#{movie_list[0]}</a></li>"
		# 		client.puts "<li><a href='/movies/The%20Godfather'>#{movie_list[1]}</a></li>"
		# 		client.puts "<li><a href='/movies/The%20Godfather:%20Part%20II'>#{movie_list[2]}</a></li>"
		# 		client.puts "<li><a href='/movies/Pulp%20Fiction'>#{movie_list[3]}</a></li>"
		# 		client.puts "<li><a href='/movies/The%20Good,%20the%20Bad%20and%20the%20Ugly'>#{movie_list[4]}</a></li>"
		# 		client.puts "<li><a href='/movies/The%20Dark%20Knight'>#{movie_list[5]}</a></li>"
		# client.puts "</ol>"




	elsif path.split("/")[1] == "movies" && path.split("/").length == 3
		
		title = URI.decode(path.split("/")[2])

			if title == "The Shawshank Redemption"
				client.puts "<html>#{title} is rated #{movie_db[0][:rating]}. It was made in #{movie_db[0][:year]}. You can find more information <a href='#{movie_db[0][:link]}''>here</a>"
			elsif title == "The Godfather"
				client.puts "<html>#{title} is rated #{movie_db[1][:rating]}. It was made in #{movie_db[1][:year]}. You can find more information <a href='#{movie_db[1][:link]}''>here</a>"
			elsif title == "The Godfather: Part II"
				client.puts "<html>#{title} is rated #{movie_db[2][:rating]}. It was made in #{movie_db[2][:year]}. You can find more information <a href='#{movie_db[2][:link]}''>here</a>"
			elsif title == "Pulp Fiction"
				client.puts "<html>#{title} is rated #{movie_db[3][:rating]}. It was made in #{movie_db[3][:year]}. You can find more information <a href='#{movie_db[3][:link]}''>here</a>"
			elsif title == "The Good, the Bad and the Ugly"
				client.puts "<html>#{title} is rated #{movie_db[4][:rating]}. It was made in #{movie_db[4][:year]}. You can find more information <a href='#{movie_db[4][:link]}''>here</a>"
			elsif title == "The Dark Knight"
				client.puts "<html>#{title} is rated #{movie_db[5][:rating]}. It was made in #{movie_db[5][:year]}. You can find more information <a href='#{movie_db[5][:link]}''>here</a>"
			end

	end

client.close

end
