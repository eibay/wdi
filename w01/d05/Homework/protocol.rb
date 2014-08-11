require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "We're connected."
client.puts "Say something."
client_says = client.gets.chomp
client.puts "HELLO!"

client.puts "Say something else."
client_says02 = client.gets.chomp
client.puts "You said #{client_says02}."

client.puts "Say something else."
client_says03 = client.gets.chomp
client.puts "You said #{client_says03}."

client.puts "Let's play ping pong."
client.puts "Say ping."
ping = client.gets.chomp

if ping != "ping" 
	client.puts "Wrong"
	puts "They got it wrong."
	client.close
else
	puts "Client says ping, you say..."
pong = gets.chomp
end



if pong != "pong"
	puts "Wrong"
	client.puts "They got it wrong."
	client.close
else
	puts "Good job."
	client.puts "Good job."
end

client.puts "Let's play guess the number."
client.puts "Type guess to begin"
ans = client.gets.chomp

if ans == "guess"
	puts "Pick a number."
else
	client.puts "The End"
	client.close
end

client.puts "Guess a number between 1 and 10"
server_number = gets.chomp
number = server_number.to_i

client_num = client.gets.chomp
num_int = client_num.to_i

if num_int == number
	client.puts "Correct!"
	puts "They got it."
else
	client.put "Wrong!"
	puts "They didn't get it."
end

client.close









