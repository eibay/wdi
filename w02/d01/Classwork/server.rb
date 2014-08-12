require "socket"
require 'pry'
server = TCPServer.new 2000

while true 
	client = server.accept
	client_ip = client.remote_address.ip_address
	
	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp
	
	path = request.split(" ")[1]
	puts "Client #{client_ip} is attempting to reach #{path}"

	if path == "/"
		client.puts File.read('./views/index.html')
		puts "Sent index.html"
	elsif path == '/stylesheets/style.css'
		client.puts File.read('./stylesheets/style.css')		
		puts "client was sent stylesheet"
	elsif path == '/about'
		client.puts File.read('./views/about.html')
		puts "Client sent about page"
	else
		client.puts "ERROR! Try again"
		puts "sent error"
	end
	

	puts "client has disconnected"
	client.close

end
