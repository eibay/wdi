require 'json'
require 'socket'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

  if path == "/"
    html = File.read('./movie-title-classwork/views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./movie-title-classwork/stylesheets/styles.css')
    client.puts(css)
  elsif path.split('/')[1] == "words"
    query = path.split('/')[2]
    word = query.split('=')[1]

    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /#{query}"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)

    html = File.read('./movie-title-classwork/views/movies.html')
    html = html.gsub('{{search_word}}', word)

    movies = []
    
    parsed["Search"].each do |movie|
      individual_movie = File.read('./movie-title-classwork/views/individual_movie.html')
      individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
      individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
      individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
      movies.push(individual_movie)
    end

    html = html.gsub('{{movies}}', movies.join(''))

    client.puts(html)
  else
    html = File.read('./movie-title-classwork/views/404.html')
    client.puts(html)
  end

  client.close

end