require 'socket'
server = TCPServer.new 2000
client = server.accept

one = client.gets.chomp

client.puts "Hello!"


two_a = user_said = client.gets

client.puts "You said #{user_said}"

two_b = user_said = client.gets

client.puts "You said #{user_said}"



three = client.gets.chomp

client.puts "pong"


four_a = client.gets.chomp

client.puts "guess a number between 1 and 10"

four_b =  client.gets.chomp

if four_b == "5"
	client.puts "Your right!"
else
	client.puts "Wrong!"

end

client.close