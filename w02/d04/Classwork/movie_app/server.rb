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


	if path.split("/")[1] == "movies"
		title = path.split("/")[2]

		omdb_api = TCPSocket.new 'www.omdbapi.com', 80
		
		omdb_api.puts "GET /?t=#{title}"

		puts "#{Time.now} - Connecting to OMDB"

		json_response = omdb_api.gets.chomp
		parsed_response = JSON.parse(json_response)

		omdb_api.close
		puts "#{Time.now} - Disconnected from OMDB"

		client.puts parsed_response
		puts "#{Time.now} - Sent movie information to #{client_ip}"

	end
	binding.pry
	client.close
	puts "#{Time.now} - Disconnected from server"

end