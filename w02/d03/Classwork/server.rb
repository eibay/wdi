require 'socket'
require 'uri'
require 'erb'


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
titles=[]
while i < movie_db.length
  movie = movie_db[i]
  titles.push("<li><a href='/movies/#{URI.encode(movie[:name])}'>#{movie[:name]}</a></li>")
  i += 1
end

server = TCPServer.new 2000

while true
  client = server.accept
  puts "Client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "Requesting #{path}"

  if path == "/movies"
    html_file=File.read("./views/example.html")

 
    client.puts html_file.gsub("{{movie_titles}}",  titles.join('')).gsub("{{style}}" , "<link rel='stylesheet' type='text/css' href='./views/style.css'>")

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
    html_file=File.read("./views/example2.html")
    replacements = [ ["{{name}}", movie[:name]], ["{{year}}", movie[:year]] , ["{{rank}}" , movie[:rank]] , ["{{link}}" , movie[:link]] , ["{{style}}" , "<link rel='stylesheet' type='text/css' href='./views/style.css'>" ]]
    replacements.each  {|replacement| html_file.gsub!(replacement[0], replacement[1])} 
     client.puts html_file
    # client.puts html_file.gsub("{{name}}" , movie[:name]).gsub("{{year}}", movie[:year]).gsub("{{rank}}", movie[:rank]).gsub("{{link}}", movie[:link]).gsub("{{style}}" , "<link rel='stylesheet' type='text/css' href='./views/style.css'>")

    # html = "<h1>#{movie[:name]}</h1>"
    # html += "<p>Released in #{movie[:year]}, is ranked #{movie[:rank]} on IMDB</p>"
    # html += "<a href='#{movie[:link]}'>Learn more here!</a>"

    # client.puts(html)
     elsif(path=="/views/style.css")
       client.puts File.read("./views/style.css")
     elsif(path=="/movies/views/style.css")
      client.puts  File.read("./views/style.css")
  end

  client.close
  puts "Client disconnected"
end