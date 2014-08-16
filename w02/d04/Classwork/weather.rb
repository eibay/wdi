require 'socket'
require 'pry'
require 'rainbow/ext/string'
require 'json'
server=TCPServer.new 2000

while true
	client=server.accept
	client_ip= client.remote_address.ip_address
	puts "#{Time.now} has connected from #{client_ip}".color(:red)

	request=client.gets.chomp
	path=request.split(" ")[1]
	puts "#{Time.now}: Client #{client_ip} is attempting to connect from #{path}".color(:green)

	
	if (path=="/inception")

		api=TCPSocket.new 'localhost', 2000
		api.puts "GET /WEATHER"

		puts"#{Time.now} :Connecting to Jeffs Weather Server".color(:magenta)

		response=api.gets
		response=JSON.parse(response)
		api.close
		puts "#{Time.now}: Disconnected from Jeffs Weather Server".color(:cyan)
		client.puts "The current weather is #{response['weather']} with a humidity of #{response['humidity']}"





	end






	puts "#{Time.now}: Client #{client_ip} has disconnected".color(:blue)
	client.close


end