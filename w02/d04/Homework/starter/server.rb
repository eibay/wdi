require 'socket'
require 'json'
require 'pry'

server = TCPServer.new 2000

# equivalent to while true
loop do

  client = server.accept
  puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client connected"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client requested #{path}"

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
#Connecting with the API
  elsif path.split("/")[1] == "words"
    omdb_api = TCPSocket.new "www.omdbapi.com", 80

    title = path.split("/")[2]

    omdb_api.puts "GET /?s=#{title}"
    puts "At #{Time.now.strftime("%I:%M:%S%P")} - Connected to OMDb"

    response = JSON.parse(omdb_api.gets)

    omdb_api.close
    puts "At #{Time.now.strftime("%I:%M:%S%P")} - Disconnected from OMDb"
#Disconnecting from the OMDb server

    movie_list = response["Search"]

    movie_list.each do |x|
      
      client.puts "<h1>#{x["Title"]}</h1>"
      client.puts "<html><ul>"
      client.puts "<li><h2>Released in #{x["Year"]}</h2></li>"
      client.puts "<li><h2><a href='#{x["imdbID"]}'>IMDb Page</a></h2></li>"
      client.puts "</ul></html>"
    end

    puts "At #{Time.now.strftime("%I:%M:%S%P")} - Sent title search to client"

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end