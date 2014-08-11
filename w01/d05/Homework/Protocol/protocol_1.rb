require 'socket'

server = TCPServer.new 2000
client = server.accept

#client.puts "say hello."
client.gets
client.puts "HELLO!"

client.puts "say a word"
echo_word = client.gets.chomp
client.puts "You said #{echo_word}."
client.puts "Say another word."
echo_word_2 = client.gets.chomp
client.puts "You said #{echo_word_2}."

client.puts "say ping"
client.gets
client.puts "pong"

client.puts "Say guess"
client.gets
client.puts "Guess a number between 1 and 10"
user_number = client.gets.chomp
my_number = "8"
if 
	user_number == my_number
	client.puts "Correct!"
else
	client.puts "Wrong!"
end






client.close