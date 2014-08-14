require 'socket'
require 'pry'
require 'uri'

server = TCPServer.new 2000


while true
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

  client = server.accept
  request = client.gets.chomp

  path = request.split(" ")[1] 
  index = 0 
  num = 1

  if path == "/movies"
    client.puts "<html><h1>IMDb Top 6 Movies of All Time</h1></html>"
  end

  while index < movies_db 
  title = movie_db[index][:name]
  link = movie_db[index][:link]
  year = movie_db[index][:year]
  rating = movie_db[index][:rating]
  title = URI.encode[:title]

  binding.pry

    #elsif path.split('/')[1] == "movies" && path.split('/').length == 3
    #name = URI.decode(path.split('/')[2])

  if path == "/movies"
     client.puts "<html><h2>##{num}</h2></html>"
     client.puts "<ul><li><a href=/movies/#{title}>#{title}</a></li> <li><a href=#{link}>Go to IMDB</a></li></ul>"


  elsif path == "/movies/#{title}"
     client.puts "<html><ul>"
     client.puts "<li>#{title}</li> <li>Year: #{year}</li> <li>Rating: #{rating}</li> <li><a href=#{link}>IMDb #{title}</a></li>"
     client.puts "</ul></html>"
  end


end
end