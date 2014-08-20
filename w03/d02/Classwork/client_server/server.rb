require 'socket'

server = TCPServer.new 2000

client = server.accept
client.gets

client.puts "HELLO STRANGE NEW WORLD!"

client.close
