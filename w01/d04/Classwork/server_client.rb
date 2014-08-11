require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Okay, I'm here. Type."
user_said = client.gets
puts "The client has answered you."
i_said = gets
client.puts "Hello!"
client.puts "You said #{user_said}"
client.puts "I said: #{i_said}"

client.close