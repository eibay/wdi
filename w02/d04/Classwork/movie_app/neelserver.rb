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

	# current if statement:
	# if path == '/inception'
	# 	omdb_api = TCPSocket.new 'www.omdbapi.com', 80
	# 	omdb_api.puts 'GET /?t=inception'

#did it off of /movies instead of just / (root) so that when we split the string we're not 
# looking at an empty space (which is what is before the /)

#new goal - make 'if statement' work for any title

#want to add movies to the path to make it super clear
# we just need a way to confirm that we're on the right path

	if path.split('/')[1] == "movies" #checking for the existence of movies path, to confirm the route
		
		movie_title = path.split('/')[2]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80

		puts "#{Time.now} - Connecting to OMBD"

		json_response = omdb_api.gets.chomp #Neel says we cld leave chomp off
		parsed_response = JSON.parse(json_response)#Ruby converts the crazy JSON string into a hash

		omdb_api.close
		puts "#{Time.now} - Disconnected from OMBD"

		client.puts parsed_response
		puts "#{Time.now} - Sent movie info to client #{client_ip}"

	end 

	client.close
	puts "#{Time.now} - Client #{client_ip} has disconnected"

end