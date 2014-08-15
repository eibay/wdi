require 'socket'
require 'pry'
require 'json'

server = TCPServer.new 2000

while true

	client = server.accept
	#for the server log
	client_ip = client.remote_address.ip_address

	puts "#{Time.now} - Client has connected from #{client_ip}"
	# client.gets.chomp, grabs just the first line of the request header
	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"

	if path == '/' 
		#to interact with jeff's weather application (3 pieces of info needed)
		jeffs_api = TCPSocket.new '192.168.40.172', 8000
		# use puts to send info to client
		jeffs_api.puts "GET /weather"

		puts "#{Time.now} - Connecting to Jeff's Weather Server"
		binding.pry 

		json_response = jeffs_api.gets
		parsed_response = JSON.parse(json_response)

		jeffs_api.close
		puts "#{Time.now} - Disconnected to Jeff's Weather Server"

		client.puts "The temperature outside is #{parsed_response["weather"]}, while humidity is #{parsed_response["humidity"]}. And also, hash crape is #{parsed_response["hash_crap"]}"

	end


	puts "#{Time.now} - Clinet #{client_ip} has disconnected"
	client.close

end