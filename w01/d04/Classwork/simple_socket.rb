require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Yo... type somethin'"
user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"

client.close