require 'socket'
require 'json'
require 'pry'

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

    # movie_name = path.split('/')[1]
    # if path == "/#{movie_name}"

  elsif path.split('/')[1] == "words"
    html = File.read('./views/words.html')
    word = path.split('/')[2]
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"

    omdb_response = JSON.parse(omdb_api.gets)

    # j = 0
    # movies = 0
    #   while movies < omdb_response["Search"].length
        omdb_response["Search"].each do |movie|
          # client.puts omdb_response["Search"][j]["Title"]
          # client.puts omdb_response["Search"]["Year"]
          # client.puts omdb_response["Search"][["imdbID"]
          html = html.gsub('{{{word}}}', word)
          html = html.gsub('{{{title}}}', movie["Search"]["Title"] )
          html = html.gsub('{{{year}}}', movie["Search"]["Year"])
          html = html.gsub('{{{imdbID}}}', movie["Search"]["imdbID"])
          client.puts(html)
        end
        # movies += 1
        client.puts(html)
      end
    omdb_api.close
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end
