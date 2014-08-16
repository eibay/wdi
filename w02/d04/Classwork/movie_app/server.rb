require "socket"
require "pry"
require "json"

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client #{client_ip} has connected at #{Time.now} "

	request = client.gets.chomp
	path = request.split(" ")[1]
	puts = "Client #{client_ip} has requested #{path} #{Time.now}"

	if path == "/"
		client.puts "Welcome to my movie database! To Search for a moive type in '/movie name' in the address bar."
		
	else 
		movie_title = path.split("/")[1]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		omdb_api.puts "GET /?t=#{movie_title}"

		puts "Client #{client_ip} has connected to OMDB at #{Time.now}"

		json_response = omdb_api.gets
		parsed_response = JSON.parse(json_response)

		client.puts parsed_response


		puts "Client #{client_ip} has disconnected from Jeff's weather server #{Time.now}"

	end 

puts "Client #{client_ip} has disconnected at #{Time.now}"
client.close
end



#using APIs
