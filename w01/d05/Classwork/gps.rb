require 'socket'
server = TCPServer.new 2000
client = server.accept

client.puts "Where do you want to go?"
location = client.gets.chomp

valid_locations = ["New York", "San Francisco", "Dallas"]

if valid_locations.include?(location)
	client.puts "Yes we go to there"
else 
	client.puts "NO"
end

client.close