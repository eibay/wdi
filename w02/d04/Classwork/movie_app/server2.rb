require 'socket'
require 'pry'
require 'json'
require 'uri'

server = TCPServer.new 2000

while true

  client = server.accept
  client_ip = client.remote_address.ip_address

  puts "#{Time.now} - Client has connected from #{client_ip}"

  request = client.gets.chomp
  path = request.split(' ')[1]
  puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

  movie_name = path.split('/')[1]

  if path == "/#{movie_name}"

    omdb_api = TCPSocket.new 'www.omdbapi.com', 80
    omdb_api.puts "GET /?t=#{movie_name}"


    puts "#{Time.now} - Connecting to OMBD"

    json_response = omdb_api.gets.chomp
    parsed_response = JSON.parse(json_response)

    omdb_api.close
    puts "#{Time.now} - Disconnected from OMBD"

    client.puts parsed_response
    puts "#{Time.now} - Sent movie info to client #{client_ip}"

  end

  client.close
  puts "#{Time.now} - Client #{client_ip} has disconnected"

end