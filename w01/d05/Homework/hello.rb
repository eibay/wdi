require 'socket'
server = TCPServer.new 2000
client = server.accept

client.puts "say something?"
answer = client.gets.chomp.downcase

puts answer 


if answer == "hello"
	client.puts "HELLO!"

	else client.puts "wrong answer"
end
client.close