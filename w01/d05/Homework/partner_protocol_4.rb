require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Please write the word 'guess'"

user_said = client.gets.chomp.downcase

if user_said == "guess"

client.puts "Guess a number between 1 and 10"

else
	client.puts "Error"

end

guessed_number = client.gets.chomp

if guessed_number == "5"
	client.puts "Correct!"

else
	client.puts "Wrong!"

end

client.close