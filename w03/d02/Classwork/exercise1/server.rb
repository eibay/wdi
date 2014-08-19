require 'socket'

server = TCPServer.new 2000

while true
	client = server.accept
	client.gets # need to put this even if we don't use the request.

	client.puts "hello world"

	client.close
end