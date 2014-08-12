require 'socket'
require 'pry'
server = TCPServer.new 2000 #where to look for it and which server

while true

#will not evaluate until browser connects-it is listening and waiting
client = server.accept # waits here for a server to accept if nc a computer(server)
client_ip = client.remote_address.ip_address  #finding ip
puts "Client has connected from #{client_ip}"
request = client.gets.chomp #give you stuff in the url
path = request.split(" ")[1] # returns in array #know the path in request, how information on high level is sent
	puts "Client #{client_ip} is attempting to reach #{path}"

if path == "/" # can tell browser what the server is looking for
	client.puts File.read ('./views/index.html') #goes to HTML
	puts "Sent index.html to #{client_ip}"
elsif path == "/stylesheets/style.css"
		#no period before /style
		client.puts File.read('./stylesheets/style.css')
		puts "Sent style.css to #{client_ip}"
	#puts hello in browser! 127.0.0.1:2000 with nothing after it
	#h1 works because chrome is smart and knows how to fix to do proper html
	#mozilla doesnt so have to send as file or add the doctype
elsif path == "/about"
	client.puts File.read("./views/about.html")
	puts "Sent about html to #{client_ip}"
	#if diff stylesheet would have to add abother els
else client.puts "ERROR"
	puts "Send Error"
	end



puts "Client #{client_ip} has disconnected"
client.close


end