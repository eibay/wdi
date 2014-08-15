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

	if path == '/'
		jeffs_api = TCPSocket.new '192.168.40.172', 8000
		jeffs_api.puts "GET /weather"

		puts "#{Time.now} - Connected to Jeff's Weather Server"

		json_response = jeffs_api.gets
		parsed_response = JSON.parse(json_response)
		
		jeffs_api.close
		puts "#{Time.now} - Disconnected from Jeff's Weather Server"
		
		client.puts "The temp is #{parsed_response['weather']} and humidity is #{parsed_response['humidity']}"

	end



	puts "#{Time.now} - Client #{client_ip} has disconnected"
	client.close
end