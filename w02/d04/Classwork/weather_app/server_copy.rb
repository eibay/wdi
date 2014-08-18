

require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true
	client = server.accept
	client_ip = client.remote_address.ip_address #server log
	
	puts "#{Time.now}- Client connected from #{client_ip}!"
	
	request = client.gets.chomp
	path = request.split(" ")[1]
	puts "#{Time.now}- Client connected from #{client_ip} is attempting to reach #{path}"





if path.split("/")[1] == "movies"

	movie_title = path.split("/")[2]

	omdb_api = TCPSocket.new "www.omdbapi.com", 80

	omdb_api.puts "GET /?t=#{movie_title}" #requests data from omdb
	# after this, then they will give us a JSON response


	puts "#{Time.now} Connecting to OMDB"

	json_response = omdb_api.gets.chomp #gets data from omdb
	parsed_response = JSON.parse(json_response)

	omdb_api.close
	puts "#{Time.now} - Disconnecting from OMDB"

	client.puts parsed_response
	puts "#{Time.now} - Sent data to client"

end

puts "#{Time.now} - client #{client_ip} has disconntected" #server log
client.close

end


