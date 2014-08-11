require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "How u doing?"
user_said = client.gets
client.puts "Hello!"
client.puts "You said #{user_said}"
client.puts "See ya later!"

client.close