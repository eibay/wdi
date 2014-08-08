require 'socket'
server = TCPServer.new 2000
client = server.accept

puts "Client connected!" #Still connected to your own terminal that shows you info that the client
#doesnt see because client is not being called before it.

client.puts "Where do you want to go?"
requested_location = client.gets.chomp

locations = ["New York", "San Francisco", "Dallas"]

if locations.include?(requested_location)
  client.puts "YES we go here"
else
  client.puts "NOPE"
end

client.close