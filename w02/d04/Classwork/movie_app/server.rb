require 'json'
require 'socket'
require 'pry'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "#{Time.now} - Client has connected from #{client_ip}"

	request = client.gets.chomp # chomp gets first line of request header
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attemptime to reach #{path}"

	if path.split('/')[1] == 'movies'
		movie = path.split('/')[2]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		omdb_api.puts "GET /?t=#{movie}"

		puts "#{Time.now} - Connected to OMDB"

		json_response = omdb_api.gets
		parsed_response = JSON.parse(json_response)

		omdb_api.close
		puts "#{Time.now} - Disconnected from OMDB"
		
		client.puts parsed_response
		puts "#{Time.now} - Sent movie info"
	end

	puts "#{Time.now} - Client #{client_ip} has disconnected"
	client.close
end