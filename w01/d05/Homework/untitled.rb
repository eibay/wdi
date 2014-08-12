require 'socket'
require 'pry'
server = TCPServer.new 2000

while true
	client = server.accept

	puts "Client connected!"

	# binding.pry

	client.puts "<h1>Howdy there, folks!</h1><h2>This is another header.</h2><a href='http://10.16.200.11:2000'>This is Alex's website</a>"

	client.gets.chomp

	client.close
end
