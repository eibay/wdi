
# 4. Guess the number
#   * Client says: `guess`
#   * Server says: `guess a number between 1 and 10`
#   * Client says: `5`
#   * Server says: if right - `correct!`, if wrong - `wrong!`

require 'socket'

server = TCPServer.new 2000
client = server.accept

puts "A client has connected"
client.puts "Welcome to our server!"
client.puts "Type in 'guess' so we can play a guessing game!"

user_said = client.gets
client.puts ("Guess a number between 1 and 10")
puts "#{user_said}"


while true
user_input = client.gets.chomp
if user_input == "5"
	client.puts "WOOOOOO! 5 was correct"
	client.close

x= false
else 
client.puts "You suck! Guess again"
x= true
end
end 
client.close


# client.puts "Type in another word of your choice and I will say the word you typed"
# user_said = client.gets
# client.puts ("You said #{user_said}")
# puts "#{user_said}"

client.close