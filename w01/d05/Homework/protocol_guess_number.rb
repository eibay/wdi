require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello! Let's play a guessing game! I'm thinking of a number between 1 and 10"

x=true
while true
user_input = client.gets.chomp
if user_input == "5"
	client.puts "Great job! 5 was my number"
	x=false
	client.close
else 
	client.puts "That's not my number, guess again!"
	x= true
end
end 
client.close
