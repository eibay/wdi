require 'socket'
server = TCPServer.new 2000
client = server.accept

<<<<<<< HEAD
puts "Client connected!" #Still connected to your own terminal that shows you info that the client
#doesnt see because client is not being called before it.
=======
puts "Client connected!"
>>>>>>> fb5ed816f11190444095b28a799aa7477a387607

client.puts "Where do you want to go?"
requested_location = client.gets.chomp

locations = ["New York", "San Francisco", "Dallas"]

if locations.include?(requested_location)
  client.puts "YES we go here"
else
  client.puts "NOPE"
end

client.close