require 'socket'

server = TCPServer.new 2000

client = server.accept

client.gets #takes the msg from client

client.puts File.read('./index.html')

client.close