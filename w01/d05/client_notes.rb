require 'socket' # a socket allows programs to interact
server = TCPServer.new 2000 # tcp allows computers to interact, 2000 is the conventional port when testing locally
client = server.accept #required for accepting connection

client.puts "where do you want to go?"
requested_location = client.gets.chomp

locations = ["New York", "San Francisco", "Dallas"]

if locations.include?(requested_location)
	client.puts "YES we go here"

else
	client.puts "Sorry"
end
client.close

#to connect to other pc
#open net cat (nc in terminal)
#enter ip port => 127.0.0.1 2000
