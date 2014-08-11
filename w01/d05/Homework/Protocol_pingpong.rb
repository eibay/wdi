require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello! Wanna play ping pong? (y/n)"
user_input = client.gets.chomp

if user_input == "y"
	client.puts "ok great!, You say \'ping\' and I\'ll say \'pong\' "
	user_input2 = client.gets.chomp
		if user_input2 == "ping"
			client.puts "pong. good game :)"
		else 
			client.puts "Too bad you didn't say ping!"
		end
elsif user_input == "n"
	client.puts "Too bad I only know how to play verbal ping pong"	
else 
	client.puts "Too bad you didn't say y/n"
end
client.puts "Goodbye user!"
client.close
