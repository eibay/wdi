require 'socket'
server = TCPServer.new 2000
client = server.accept


client.puts "say ping"
answer = client.gets.chomp.downcase
puts answer
	if answer == "ping"
		client.puts "pong"
	else 
		client.puts "no answer"
	end 
	


client.close