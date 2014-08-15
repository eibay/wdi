require 'json'
require 'socket'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp

  puts request 
  path = request.split(" ")[1]
  puts path 

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css) 
  elsif path.split('/')[1][0,8] == "movies?s"
    word = path.split('/')[1][9,path.length-1]
    puts word  

    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /?s=#{word}"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)
    if parsed.include? "Error"
      client.puts "<h1>There are no movies w/ \"#{word}\" in them</h1>"
    else 

      html = File.read('./views/movies.html')
      html = html.gsub('{{search_word}}', word)

      movies = []
    
      parsed["Search"].each do |movie|
        individual_movie = File.read('./views/individual_movie.html')
        individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
        individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
        individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
        movies.push(individual_movie)
      end

      html = html.gsub('{{movies}}', movies.join(''))

      client.puts(html)
    end 
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end