require 'socket'

server = TCPServer.new 2000
client = server.accept

user_said = client.gets.chomp

client.puts user_said.upcase + "!"


client.close