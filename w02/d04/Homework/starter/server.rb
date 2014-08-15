require 'socket'
require 'pry'
require 'JSON'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept

  request = client.gets.chomp
  path = request.split(" ")[1]

# path = when the browser comes to our server
if path.split('/')[1] == "words"
  word = path.split('/')[2]
  omdb_api = TCPSocket.new 'www.omdbapi.com', 80
  # use puts to send info to client
  omdb_api.puts "GET /words/?s=#{word}" 
end

json_response = omdb_api.gets.chomp
parsed_response = JSON.parse(json_response)

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end


