require 'json'
require 'socket'
require 'pry'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]
binding.pry
query = path.split('/')[1]
hash = {}
if query.include?("&")
  elements = query.split("?")
  hash[:path] = elements[0]
  hash[:query_params] = {}
  hasher = []
  hasher << elements[1].split("&")
  hasher.each do |x|
    hash[:query_params] = Hash[*x]
    end 
end

hash[:path] = elements[0]
elements[1].split('&')
elements << elements[1].split('&')
elements[2].each do |x| elements << x.split('=') end
hash[(elements[3][0].to_sym)] = elements[3][1]
hash[(elements[4][0].to_sym)] = elements[4][1]


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
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end
