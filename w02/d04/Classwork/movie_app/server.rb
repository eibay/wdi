require 'socket'
require 'pry'
require 'JSON'

server = TCPServer.new 2000

while true

	client = server.accept
	#for the server log
	client_ip = client.remote_address.ip_address

	puts "#{Time.now} - Client has connected from #{client_ip}"
	
	# http://127.0.0.1:2000/movies/inception

	# client.gets.chomp, grabs just the first line of the request header
	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"
	# path = when the browser comes to our server
	if path.split('/')[1] == "movies" #just movies not '/ movies' because it is a string 
		movie_title = path.split('/')[2]
		#to interact with jeff's weather application (3 pieces of info needed)
		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		# use puts to send info to client
		omdb_api.puts "GET /?t=#{movie_title}" #<- #{} called string interpolation

		puts "#{Time.now} - Connecting to OMDB"
		
		json_response = omdb_api.gets.chomp
		parsed_response = JSON.parse(json_response)

		omdb_api.close
		puts "#{Time.now} - Disconnected to OMDB"

		client.puts parsed_response
		puts "#{Time.now} - Sent movie info to client #{client_ip}"
	
	end


	client.close
	puts "#{Time.now} - Clinet #{client_ip} has disconnected"

end