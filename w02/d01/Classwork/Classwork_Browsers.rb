
require 'socket'

server = TCPServer.new 2000

while true #a loop that will always stay open

client = server.accept #accept method, accepts a client's request to connect
client_ip = client.remote_address.ip_address

puts "Client has connected from #{client_ip}"

request = client.gets.chomp	#this is the content the browser is going to

# request = "GET /cars HTTP/1.1"

request.split(" ")

path = request.split(" ")[1] #pulls the specific path they want (which is after the main home page)

puts "Client #{client_ip} is attempting to reach #{path}"

if path == '/' #means if the path == root
	client.puts "<h1>Hello World!</h1>"
	puts "Sent Hello World to #{client_ip}"
end

puts "Client #{client} has disconnected." #all these statements help us track and log 
#user interaction with the server


#binding.pry #computer stops the program right here to focus in and debug

# client.puts "Hello World!"	
# request = client.gets.chomp #what you put in code to talk thru browser (i think)
# puts request #this goes with the line above

client.close

end