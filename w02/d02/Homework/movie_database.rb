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
  # connect
  client = server.accept

  # listen - or get input
  request = client.gets.chomp
  puts "Client said: #{request}"

  path = request.split(" ")[1]

  x = 0
  y = 0

if path == "/movies"

client.puts "<html><ol>"  
  while x < movie_db.length
    # movie_name = URI.decode(movie_db[x][:name])
    client.puts "<li><a href='/movies/#{movie_db[x][:name]}'>#{movie_db[x][:name]}</a></li>"
    x += 1
    end

client.puts "</ol></html>"

 elsif path.split('/')[1]=="movies" && path.split('/')[2]
  name = URI.decode(path.split('/')[2])
    while y < movie_db.length
      if movie_db[y][:name] == name
    client.puts "<html>#{movie_db[y][:name]}<br>Rating: #{movie_db[y][:rating]}<br>Rank: #{movie_db[y][:rank]}<br><a href = '#{movie_db[y][:link]}''>IMDB link</a><br>Year: #{movie_db[y][:year]}</html>"
  end
    y += 1
  end
  else

    client.puts "<h1>Error. Page not found.</h1>"
  end   
  
  client.close
  end


# elsif movie_name < movie_db[1][:name]

# client.puts "<html>#{movie_name}<br>Rating: #{movie_rating}<br>Rank: #{movie_rank}<br>IMDB: #{movie_link}<br>Year: #{movie_year}</html>"


# elsif y == movie_db[2]

# client.puts "<html>#{movie_name}<br>Rating: #{movie_rating}<br>Rank: #{movie_rank}<br>IMDB: #{movie_link}<br>Year: #{movie_year}</html>"


# elsif y == movie_db[3].length

# client.puts "<html>#{movie_name}<br>Rating: #{movie_rating}<br>Rank: #{movie_rank}<br>IMDB: #{movie_link}<br>Year: #{movie_year}</html>"


# elsif y == movie_db[4].length

# client.puts "<html>#{movie_name}<br>Rating: #{movie_rating}<br>Rank: #{movie_rank}<br>IMDB: #{movie_link}<br>Year: #{movie_year}</html>"


# elsif y == movie_db[5].length

# client.puts "<html>#{movie_name}<br>Rating: #{movie_rating}<br>Rank: #{movie_rank}<br>IMDB: #{movie_link}<br>Year: #{movie_year}</html>"