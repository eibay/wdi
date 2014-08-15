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

    j = 0
    movies = 0
      while movies < omdb_response["Search"].length
        while j < omdb_response["Search"].length
          # client.puts omdb_response["Search"][j]["Title"]
          # client.puts omdb_response["Search"][j]["Year"]
          # client.puts omdb_response["Search"][j]["imdbID"]
          html = html.gsub('{{{word}}}', word)
          html = html.gsub('{{{title}}}', omdb_response["Search"][j]["Title"] )
          html = html.gsub('{{{year}}}', omdb_response["Search"][j]["Year"])
          html = html.gsub('{{{imdbID}}}', omdb_response["Search"][j]["imdbID"])
          # client.puts(html)
          j += 1
        end
        movies += 1
        client.puts(html)
      end
    omdb_api.close
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end
