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
    omdb.close
    parsed = JSON.parse(response)

    movies[]

    parsed["Search"].each do |movie|

      movies.push("<li>#{movie["Title"]} (#{movie["Year"]}</li>")

      html = File.read('./views/movies.html')
      html = html.gsub('{{search_word}}', "#{word}")
      html = html.gsub('{{movies}}' movies.join(''))

      client.puts(html)
    end
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end