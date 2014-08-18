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
	puts "#{Time.now} - Client #{client_ip} is attempting ot reach #{path}"


	if path == '/'
		client.puts 'testing server' #testing if it works
		jeffs_api = TCPSocket.new '192.168.40.172', 8000
		jeffs_api = "GET /weather"

		puts "#{Time.now} - Connecting to Jeff's Weather Server"

		json_response = jeffs_api.gets.chomp #not client.gets
		parsed_response = JSON.parse(json_response)

		jeffs_api.close
		puts "#{Time.now} - Disconnected from Jeff's Weather Server"

		client.puts "The temperature outside is #{parsed_response["weather"]}, while the humidity is #{parsed_response["humidity"]} And also, hash crap is #{parsed_response["hash_crap"]}"
	end

	client.close
	puts "client disconnected"
end

# a = '{\weather\":\"69 F\",\"humidity\":\"56%",\"hash_crap\":true}\n'