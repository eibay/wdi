require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000
# 127.0.0.1:2000/movies/donkey
# equivalent to while true
loop do

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to read #{path}"

  if path == "/"
    html = File.read('./views/index.html')
    client.puts(html)
  elsif path.split("/")[1] == "movies" #comment
    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    random_word = path.split('/')[2]
    query_string = "GET /?s=" + random_word

    omdb_api.puts query_string
    puts "#{Time.now} - Connection to OMBD"

    json_response = omdb_api.gets
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"

    # client.puts parsed_response
    client.puts parsed_response["Search"][0]
    puts "#{Time.now} - Sent movies with #{random_word} info to client #{client_ip}"

  elsif path == "/styles.css"
    css = File.read('./stylesheets/styles.css')
    client.puts(css)
  else
    html = File.read('./views/404.html')
    client.puts(html)
  end

  client.close

end