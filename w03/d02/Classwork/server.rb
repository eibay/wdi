require 'socket'

server = TCPServer.new 2000

client = server.accept

# client.puts "Type something to get started!"
client.gets

client.puts "Hello world"

client.close
