require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Let's pick a number"
client.puts "Choose a number 1 - 10"
user_said = client.gets.chomp
user_num = user_said.to_i

puts "The other side has chosen their number"
puts "What will you choose"
server_said = gets.chomp
server_num = server_said.to_i

client.puts "The other side chose #{server_said}"
client.puts "You chose #{user_said}"

puts "The other side chose #{server_said}"
puts "You chose #{user_said}"

if user_num > server_num
	client.puts "YOU WIN"
	puts "YOU LOSE"
elsif user_num < server_num
	client.puts "YOU LOSE"
	puts "YOU WIN"
elsif user_num == server_num
	client.puts "tie..."
	puts "tie..."
elsif user_num >= 10
	client.puts "You're a real piece of work"
	client.puts "Game Over"
	puts "Game Over"
end


client.close