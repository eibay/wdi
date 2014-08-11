require 'socket'

server = TCPServer.new 2000
client = server.accept


client.puts "What's your name?"

user_said = client.gets.chomp.downcase

client.puts "Hello, #{user_said}! What is your favorite color?"
user_said2 = client.gets.chomp

client.puts "I also love the color #{user_said2}! Where are you from?"
user_said3 = client.gets.chomp

client.puts "I hear #{user_said3} is beautiful this time of year. Would you like to continue this conversation?"
user_said4 = client.gets.chomp.downcase

if user_said4 == "yes"

client.puts "That's nice! But I actually have to go. Goodbye!"

elsif user_said4 == "no"

	client.puts "Nice chatting with you. Goodbye!"

else
	client.puts "Sorry, please answer yes or no. Thank you."

end

client.close