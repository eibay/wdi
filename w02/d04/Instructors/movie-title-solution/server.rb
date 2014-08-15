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

    # parsed["Search"].each do |movie|
    #   html1 = File.read('./views/movies.html')
    #   html1 = html.gsub('{{search_word}}', word)
    #   end

    # parsed["Search"].each do |movie|
    #   html2 = File.read('./views/movies.html')
    #   html2 = html.gsub('{{title}}', movie["Title"])
    #   html2 = html.gsub('{{year}}', movie["Year"])
    #   html2 = html.gsub('{{imdb_id}}', movie["imdbID"])
    #   client.puts(html)
    # end
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end