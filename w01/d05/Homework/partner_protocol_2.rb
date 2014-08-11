require 'socket'

server = TCPServer.new 2000
client = server.accept


user_said = client.gets.chomp.split (" ")
split_response = user_said[1]

client.puts "You said #{split_response}"

client.close