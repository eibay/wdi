require 'socket'
require 'uri'
require 'pry'

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



titles = []

i = 0
while i < movie_db.length
  movie = movie_db[i]
  titles.push("<li><a href='/movies/#{URI.encode(movie[:name])}'>#{movie[:name]}</a></li>")
  i += 1
end



while true
  client = server.accept
  puts "Client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "Requesting #{path}"

  if path == "/movies"
    # html = "<h1>The Movies!</h1>"
    # html += "<ol>" + titles.join('') + "</ol>"
    # title = titles.join("")
    html = File.read('./views/movie.html')
    html = html.gsub('{{titles}}', titles.join(''))
    # binding.pry
    client.puts(html)
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

    # html = "<h1>#{movie[:name]}</h1>"
    # html += "<p>Released in #{movie[:year]}, is ranked #{movie[:rank]} on IMDB</p>"
    # html += "<a href='#{movie[:link]}'>Learn more here!</a>"
    subs = [
      ['{{movie name}}', movie[:name]],
      ['{{movie year}}', movie[:year]],
      ['{{movie rank}}', movie[:rank]],
      ['{{movie link}}', movie[:link]]
    ]


    html2 = File.read('./views/movie_title.html')
    # html2 = html2.gsub('{{movie name}}', movie[:name])
    # binding.pry
    html2 = File.read('./views/movie_title.html')
    j = 0
    while j < subs.length
      html2 = html2.gsub(subs[j][0], subs[j][1])
      j += 1
    end


    client.puts(html2)
  end

  client.close
  puts "Client disconnected"
end
