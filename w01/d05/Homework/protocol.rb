require 'socket'

server = TCPServer.new 2000
client = server.accept

while (input = client.gets)
	client.puts input
if input.to_s == "hello"
	client.puts "HELLO!"
end
end