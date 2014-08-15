require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "At #{Time.now.strftime("%I:%M:%S%P")} Client has connected from #{client_ip}"

	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "At #{Time.now.strftime("%I:%M:%S%P")} Client #{client_ip} is attempting to reach #{path}"

	if path.split("/")[1] == "movies"
		omdb_api = TCPSocket.new 'www.omdbapi.com', 80

		movie_title = path.split('/')[2]

		omdb_api.puts "GET /?t=#{movie_title}"

		puts "At #{Time.now.strftime("%I:%M:%S%P")} Connection to OMDb"

		json_response = omdb_api.gets
		parsed_response = JSON.parse(json_response)

		omdb_api.close
		puts "At #{Time.now.strftime("%I:%M:%S%P")} Disconnected from OMDb"

		client.puts parsed_response
		puts "At #{Time.now.strftime("%I:%M:%S%P")} Sent movie info to client"


	end




	puts "At #{Time.now.strftime("%I:%M:%S%P")} Client #{client_ip} has disconnected"
	client.close


end