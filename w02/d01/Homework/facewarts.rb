require 'socket'
require 'pry'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp
	path = request.split(" ")[1]
	if path == "/"
		client.puts File.read('./views/index.html')
		puts "Sent 'index.html' to #{client_ip}"
	
	elsif path == "/stylesheets/style.css" 
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}"

	elsif path == "/about"
		client.puts File.read('./views/about.html')
		puts "Sent 'about.html' to #{client_ip}"

	elsif path == "/gryffindor"
		client.puts File.read('./views/gryffindor.html')
		puts "Sent 'gryffindor.html' to #{client_ip}"

	elsif path == "/harry_potter"
		client.puts File.read('./views/harry_potter.html')
		puts "Sent 'harry_potter.html' to #{client_ip}"

	elsif path == "/hermione_granger"
		client.puts File.read('./views/hermione_granger.html')
		puts "Sent 'hermione_granger.html' to #{client_ip}"

	elsif path == "/slytherin"
		client.puts File.read('./views/slytherin.html')
		puts "Sent 'slytherin.html' to #{client_ip}"

	elsif path == "/draco_malfoy"
			client.puts File.read('./views/draco_malfoy.html')
			puts "Sent 'draco_malfoy.html' to #{client_ip}"

	elsif path == "/severus_snape"
			client.puts File.read('./views/severus_snape.html')
			puts "Sent 'severus_snape.html' to #{client_ip}"
	
		
	else
		client.puts "ERROR! Try again"
		puts "Sent Error to #{client_ip}"

	end

	puts "Client #{client_ip} has disconnected"

	puts "Client #{client_ip} is attempting to reach #{path}"
	client.close


end	