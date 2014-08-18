require 'json'
require 'socket'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif path.split('/')[1] == "words"
    word = path.split('/')[2]

    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /?s=#{word}"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)

<<<<<<< HEAD:w02/d04/Classwork/movie-title-classwork/movie-title-solution/server.rb
    ind_movie = File.read('./views/ind_movie.html')
    html = File.read('./views/movies.html')
    search_result = []

    parsed["Search"].each do |movie|
      ind_movie = ind_movie.gsub('{{search_word}}', word)
      ind_movie = ind_movie.gsub('{{title}}', movie["Title"])
      ind_movie = ind_movie.gsub('{{year}}', movie["Year"])
      ind_movie = ind_movie.gsub('{{imdb_id}}', movie["imdbID"])
      search_result << ind_movie
    end
      client.puts(html.gsub('{{ind_movie}}', search_result.join('')))
    
=======
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
>>>>>>> 67d5ff5e9daa6c49b5b5e5973034bfffe45aaea7:w02/d04/Instructors/movie-title-solution/server.rb
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end