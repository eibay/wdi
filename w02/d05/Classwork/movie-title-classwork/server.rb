require 'json'
require 'socket'
require 'pry'

def convert(str)
  path = str.split("?")
  query_string = path[1].split("&")
  query_params = []
  query_string.each do |param|
    query_params << param.split("=")
  end
  batch = {
    path: path[0][1..-1],
    query_params: {}
  }
  query_params.each do |arr|
    batch[:query_params][arr[0].to_sym] = arr[1]
  end
  batch
end


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
  elsif path.include?("?")
    queries = convert(path)

    omdbapi = TCPSocket.new 'www.omdbapi.com', 80
    omdbapi.puts "GET /?s=#{queries[:query_params][:specific_word]}"
    response = omdbapi.gets
    omdbapi.close
    parsed = JSON.parse(response)

    html = File.read('./views/movies.html')
    html = html.gsub('{{search_word}}', queries[:query_params][:specific_word])

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
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end