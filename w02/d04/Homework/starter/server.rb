require 'socket'
require 'pry'
require 'json'


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
  elsif path.split("/")[1] == "words"
    word = path.split("/")[2]

    omdb_api = TCPSocket.new "www.omdbapi.com", 80 
    #create a new partner by connecting to them at the url address at the port listed
    
    omdb_api.puts "GET /?s=#{word}"
    #to connection partner omdb_api, send a request "GET /?s=" and the word that was input by client
    puts "connecting to omdbapi.com now"

    json_response = omdb_api.gets.chomp
    parsed_json_response = JSON.parse(json_response)
    search = parsed_json_response["Search"] #the entire thing is a hash containing a single array.
      # title = search.

    omdb_api.close # close it
    puts "disconnecting from omdbapi.com"

    search.each do |x|
      client.puts x
    end
    puts "sent data to client"

  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end