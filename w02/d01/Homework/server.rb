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
	elsif path == "/gryffindor"
		client.puts File.read('./views/gryffindor.html')
		puts "Client sent Gryffindor page"
	elsif path == "/slytherin"
		client.puts File.read('./views/slytherin.html')
		puts "client sent Slytherin page"
	elsif path == "/slytherin/snape"
		client.puts File.read('./views/slytherin/snape.html')
		puts "client sent snape page"
	elsif path == "/slytherin/Draco"
		client.puts File.read('./views/slytherin/draco.html')
		puts "client sent draco page"
	elsif path == "/gryffindor/harry"
		client.puts File.read('./views/gryffindor/harry.html')
		puts "client sent harry page"	
	elsif path == "/gryffindor/dumbledore"
		client.puts File.read('./views/gryffindor/dumbledore.html')
		puts "client sent dumbledore page"	
	else
		client.puts "ERROR! Try again"
		puts "sent error"
	end
	

	puts "client has disconnected"
	client.close

end
