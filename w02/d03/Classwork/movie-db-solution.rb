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
   {
      name: "Superman",
      rating: "7.4",
      rank: "8",
      link: "http://www.imdb.com/title/tt0078346/",
      year: "1978"
   }
]
titles = []

i = 0
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
    html = File.read('./views/index.html')

    # html = "<h1>The Movies!</h1>"
    # html += "<ol>" + titles.join('') + "</ol>"

    client.puts html.gsub("{{titles}}", titles.join(""))

  elsif path.split("/")[1] == "movies" && path.split("/").length == 3
    title = URI.decode(path.split('/')[2])

    # http://127.0.0.1:2000/movies/The%20Shawshank%20Redemption

    # find movie in array
    i = 0
    while i < movie_db.length
      if movie_db[i][:name] == title
        movie = movie_db[i]
      end

      i += 1
    end
    html = File.read('./views/example.html')
    html = html.gsub("{{movie[:name]}}", movie[:name])
    # binding.pry
    html = html.gsub("{{movie[:year]}}", movie[:year])
    html = html.gsub("{{movie[:rank]}}", movie[:rank])
    html = html.gsub("{{movie[:link]}}", movie[:link])

    ###Above is keep pointing the variable to successfully modify the string###

    # html = "<h1>#{movie[:name]}</h1>"
    # html += "<p>Released in #{movie[:year]}, is ranked #{movie[:rank]} on IMDB</p>"
    # html += "<a href='#{movie[:link]}'>Learn more here!</a>"

    client.puts html

  elsif path == "/style.css" #This has to match the name of the path in the HTML FILE!!!!
    #It doesnt need to match the actual name of the css file!!. PATH TO HTML FILE AND ITS
    #CONNECTION ONLY

    css = File.read("./stylesheets/style.css") #This matches the actual name of the CSS FILE!!!, IT DOES
    #NOT NEED TO MATCH WITH THE PATH SET IN THE HTML FILE!
    client.puts(css)


 #trying to add css to individual pages
  elsif path == "/superman.css"
    superman_css = File.read("./stylesheets/superman.css")
    client.puts(superman_css)
  end

  client.close
  puts "Client disconnected"
end





