require 'socket'

server = TCPServer.new 2000
client = server.accept

client.puts "Hello! Welcome to my server. Please say hello"
user_input = client.gets.chomp
if user_input == "hello"
	client.puts "Hello back"
else 
	client.puts "You didn't say hello!"
end

client.close

