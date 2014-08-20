require 'socket'

server = TCPServer.new 2000

client = server.accept

request = client.gets

client.puts "Hello World"

client.close