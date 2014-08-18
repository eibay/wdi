require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 4000

# equivalent to while true
while true
  client = server.accept

  request = client.gets.chomp
  path = request.split(' ')[1]
  word = path.split('/')[2]


  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  elsif path == "/words/#{word}"
    html = File.read('./word1.html')
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?s=#{word}"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)
 end
binding.pry
  title = []
  parsed_response["Search"].each do |movie|
    titles.push(movie["Title"])
end
end