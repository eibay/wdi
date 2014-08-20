require 'socket'

server = TCPServer.new 2000
loop do
	client = server.accept

	client.gets
	client.puts "I dont like monkeys!"

	client.close
end