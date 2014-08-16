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
		client.puts "testing server"


		jeffs_api = TCPSocket.new '192.168.40.172', 8000
		jeffs_api.puts "GET /weather"
		puts "Client #{client_ip} has connected to jeff's weather server at #{Time.now}"

		json_response = jeffs_api.gets
		parsed_response = JSON.parse(json_response)
		
		jeffs_api.close
		puts "Client #{client_ip} has disconnected from Jeff's weather server #{Time.now}"

		client.puts "The temperature outside is #{parsed_response["weather"]}, whle the humidity is #{parsed_response["humidity"]}. And also, hash crap is #{parsed_response["hash_crap"]}"
	end 

puts "Client #{client_ip} has disconnected at #{Time.now}"
client.close
end
