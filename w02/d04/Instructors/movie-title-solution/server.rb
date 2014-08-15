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

  client.puts "<h1>#{word}</h1>"
    client.puts "<ol>"
    parsed["Search"].each do |movie|
      html = File.read('./views/movies.html')
      html = html.gsub('{{title}}', movie["Title"])
      html = html.gsub('{{year}}', movie["Year"])
      html = html.gsub('{{imdb_id}}', movie["imdbID"])
    client.puts(html)
    end
    client.puts "</ol>"
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end