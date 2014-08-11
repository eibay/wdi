require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello!"
user_said = client.gets
client.puts "You said #{user_said}"

client.close