require 'socket'

server = TCPServer.new 2000
client = server.accept


user_said = client.gets.chomp

if user_said == "ping"

client.puts "pong"

else
	client.puts "Error"

end

client.close