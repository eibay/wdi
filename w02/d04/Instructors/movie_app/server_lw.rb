require 'socket'
require 'pry'
require 'json'
require 'uri'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "#{Time.now} - Client has connected from #{client_ip}"

	# http://127.0.0.1:2000/movies/inception
	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

<<<<<<< HEAD:w02/d04/Instructors/movie_app/server_lw.rb
	if path == '/'
	client.puts "What movie would you like information on?"
#	which_movie = gets.chomp
binding.pry

#	elsif path.split("/")[1] == "movies" && path.split("/")[2]
	elsif path.split('/')[1] == "movies"
		which_movie = path.split("/")[2]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		omdb_api.puts "GET /?t=#{which_movie}"
=======
	if path.split('/')[1] == "movies"
		movie_title = path.split('/')[2]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		# binding.pry
		omdb_api.puts "GET /?t=#{movie_title}"
>>>>>>> 8742805006b197a73a77dc282ee70449e873ffa9:w02/d04/Instructors/movie_app/server.rb

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