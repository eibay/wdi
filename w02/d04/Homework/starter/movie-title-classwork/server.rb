require 'socket'
require 'pry'
require 'JSON'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]



end


  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
# path = when the browser comes to our server
  elsif if path.split('/')[1] == "words"
  word = path.split('/')[2]


  omdbapi = TCPSocket.new 'www.omdbapi.com', 80
  # use puts to send info to client
  omdbapi.puts "GET /?s=#{word}" 
  response = omdbapi.gets
  parsed = JSON.parse(response)

  html = File.read('./views/movies.html')
  html = html.gsub('{{search_word}}', word)


  movies= []

parsed["Search"].each do |movie|
    #interpolation
  individual_movie = File.read('./views/individual_movie.html')
  individual_movie = individual_movie.gsub('{{title}}', movie["Title"])
  individual_movie = individual_movie.gsub('{{year}}', movie["Year"])
  individual_movie = individual_movie.gsub('{{imdb_id}}', movie["imdbID"])
  movies.push(individual_movie)
end

html = html.gsub('{{movies}}'), movies.join(''))


client.puts(html)
# movie = movies.join(' ') #to make an array a string
 
 
  # html = html.gsub('{{title}}',parsed["Search"][0]["Title"])
  # html = html.gsub('{{year}}',parsed["Search"][0]["Year"])
  # html = html.gsub('{{imdb_id}}',parsed["Search"][0]["imdbID"])


  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end


