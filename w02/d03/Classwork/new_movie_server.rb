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

binding.pry


  if path == "/movies"
    # html = "<h1>The Movies!</h1>"
    # html += "<ol>" + titles.join('') + "</ol>"
    
    html = File.read('./views/movie_index.html')

    #I had this but this didn't work
    html = html.gsub('{{titles}}', titles.join(''))

#tried this
   #html_updated = html.gsub('{{titles}}', titles.join(''))

    #.gsub(string item that we read from the html)(new string we want to put in it's place)
    #you can put a array.method like this in there (or a variable) as long as it equals to a string   
    #have to create a NEW variable for this modified html

    client.puts(html)

#http://127.0.0.1:2000/movies/The%20Shawshank%20Redemption
#(i copied this from the browser - is this typically 
#what request = client.gets.chomp gives us?)
#this part of the code must be right tho, b/c u gave it to us :)

  elsif path.split("/")[1] == "movies" && path.split("/").length == 3
    title = URI.decode(path.split('/')[2])
    # find movie in array
    i = 0
    while i < movie_db.length
      if movie_db[i][:name] == title
        movie = movie_db[i] 
      end

      i += 1
    endn

    html = File.read('./views/movie_detail_page.html')

    html = html.gsub('{{movie}}', movie[:name])
    html = html.gsub('{{year}}', movie[:year])
    html = html.gsub('{{rank}}', movie[:rank])
    html = html.gsub('{{link}}', movie[:link])
    #we can keep the same variable because any modification to the variable does
    #not cause a problem the content on the html page

#this was for the non html page example from yesterday
    # html = "<h1>#{movie[:name]}</h1>"
    # html += "<p>Released in #{movie[:year]}, is ranked #{movie[:rank]} on IMDB</p>"
    # html += "<a href='#{movie[:link]}'>Learn more here!</a>"

    client.puts(html)

end

  client.close
  puts "Client disconnected"
end