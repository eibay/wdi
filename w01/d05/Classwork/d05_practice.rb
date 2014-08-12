require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hi!"
user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"

client.close