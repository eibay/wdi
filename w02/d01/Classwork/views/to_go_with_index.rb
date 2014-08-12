#this is called a server log

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
	client.puts File.read('index.html') #this tells it what file to read
	puts "Sent 'index.html' to #{client_ip}"#we sent this to the client  
elsif path == '/stylesheets/style.css' #you always have a / on a URL, it's just to separate/show subfolder
#means if the path is to the stylesheet - for browser / means folder where your website is index.html
	client.puts File.read('../stylesheets/style.css') #this tells it what file to read-on your computer
	puts "Sent 'style.css' to #{client_ip}"#we sent this to the client  
elsif path == "/about.html"
	client.puts File.read('about.html')
	puts "Sent 'about.html' to #{client_ip}"#we sent this to the client  
else client.puts "Error. Try again."
	puts "sent error to client_ip"

end

#needs to be a file path without a period in the if statement, because thats how path will appear in the browser
#but we need a .

puts "Client #{client_ip} has disconnected." #all these statements help us track and log 
#user interaction with the server

client.close

end