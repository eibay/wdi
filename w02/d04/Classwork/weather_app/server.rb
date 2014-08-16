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

	if path == '/'

		jeffs_api = TCPSocket.new '192.168.40.172', 8000
		jeffs_api.puts "GET /weather"
		puts "At #{Time.now.strftime("%I:%M:%S%P")} Connection to Jeff's Weather Server"

		json_response = jeffs_api.gets
		parsed_response = JSON.parse(json_response)

		jeffs_api.close
		puts "At #{Time.now.strftime("%I:%M:%S%P")} Disconnected from Jeff's Weather Server"

		client.puts "The temperater outside is #{parsed_response["weather"]}, while the humidity is #{parsed_response["humidity"]}.  And also, hash crap is #{r\parsed_response["hash_crap"]}"

	end




	puts "At #{Time.now.strftime("%I:%M:%S%P")} Client #{client_ip} has disconnected"
	client.close


end