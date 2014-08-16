require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "#{Time.now} - Client has connected from #{client_ip}"

	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

	if path.split('/')[1] == 'movies'
		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		omdb_api.puts 'GET /?t=inception'

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