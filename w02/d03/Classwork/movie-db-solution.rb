require 'socket'
require 'uri'
require 'pry'

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
titles = []

i = 0
while i < movie_db.length
  movie = movie_db[i]
  html_titles = File.read("./views/titles.html")
  titles.push(html_titles.gsub('{{URI.encode(movie[:name])}}', URI.encode(movie[:name])).gsub('{{movie[:name]}}', movie[:name]))
  i += 1
end
# binding.pry
server = TCPServer.new 2000

while true
  client = server.accept
  puts "Client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "Requesting #{path}"

  if path == "/movies"
    html_index = File.read('./views/index.html')
    client.puts html_index.gsub('{{titles}}', titles.join(''))
  
  elsif path.split("/")[1] == "movies" && path.split("/").length == 3
    title = URI.decode(path.split('/')[2])
    # find movie in array
    i = 0
    while i < movie_db.length
      if movie_db[i][:name] == title
        movie = movie_db[i]
      end

      i += 1
    end
# binding.pry
    html_movie_page = File.read('./views/movie_page.html')
    client.puts(html_movie_page.gsub('{{movie[:name]}}', movie[:name]).gsub('{{movie[:year]}}', movie[:year]).gsub('{{movie[:rank]}}', movie[:rank]).gsub('{{movie[:link]}}', movie[:link]))
  end

  client.close
  puts "Client disconnected"
end