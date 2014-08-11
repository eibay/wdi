require 'socket'

while true
	server = TCPServer.new 2000
	client = server.accept

	client.puts "Where do you want to go?"
	requested_location = gets.chomp

	locations = ["New York", "San Francisco", "Dallas"]

	if locations.include?(requested_location)
	  client.puts "YES we go here"
	else
	  client.puts "NOPE"
	end
end
client.close