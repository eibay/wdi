require 'socket'

server = TCPServer.new 2000

client = server.accept

client.gets

client.puts "Hello World"

client.close