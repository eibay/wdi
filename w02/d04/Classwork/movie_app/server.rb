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

	if path[0] == '/'
		if path[1,path.length] != '' # is there anything after '/'?
			title = path[1,path.length] # then it is a possible film title
			puts "#{Time.now} - Client may be trying to get info about #{title}" 

			omdb_api = TCPSocket.new 'www.omdbapi.com', 80
			omdb_api.puts "GET /?t=#{title}"

			puts "#{Time.now} - Connecting to OMBD"

			json_response = omdb_api.gets.chomp
			parsed_response = JSON.parse(json_response)

			omdb_api.close
			puts "#{Time.now} - Disconnected from OMBD"

			if parsed_response.include? "Error" # if the film does not exist 
				client.puts "<h1>No movie by that name.</h1>" # tell them so 
			else # otherwise 
				client.puts parsed_response  # send them the JSON 
			end 
			puts "#{Time.now} - Sent movie info to client #{client_ip}"
		else 
			client.puts "<h1>Movies, etc, movies, etc, movies, etc</h1>"
		end 
	end 

	client.close
	puts "#{Time.now} - Client #{client_ip} has disconnected"

end