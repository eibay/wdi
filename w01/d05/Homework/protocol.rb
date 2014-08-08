# 192.168.32.126 #jill
# # ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
# 192.168.32.143 #alex

require 'socket'
server = TCPServer.new 2000
client = server.accept

one = client.gets.chomp
client.puts "HELLO!"

two_a = client.gets.chomp
client.puts "You said word"
two_b = client.gets.chomp
client.puts "You said another word"

three = client.gets.chomp
client.puts "pong"

four_a = client.gets.chomp
client.puts "guess a number between 1 and 10"
four_b = client.gets.chomp
if four_b == "5"
	client.puts "correct!"
else
	client.puts "wrong!"
end


client.close
