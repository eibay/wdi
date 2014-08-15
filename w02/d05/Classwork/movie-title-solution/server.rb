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
    parsed = JSON.parse(response)

    list = []
    parsed["Search"].each do |movie|
      list.push("<li>#{movie['Title']} ( #{movie['Year']} ) <a href='http://www.imdb.com/title/#{movie['imdbID']}'>See IMDB</a></li>")
    end

    html = File.read('./views/movies.html')
    html = html.gsub('{{list}}', list.join('')).gsub("{{search_word}}", word)
    client.puts(html)

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end