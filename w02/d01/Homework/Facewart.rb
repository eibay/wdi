require 'socket'

server = TCPServer.new 3000

while true
	client = server.accept
	client_ip = client.remote_address.ip_address

 	puts "Client has connected from #{[client_ip]}"

 	request = client.gets.chomp

 	path = request.split(" ")[1]

 	puts " Client #{client_ip} is attempting to reach #{path}"


	if path == "/"
		client.puts File.read('./index.html')
		puts "sent 'index.html' to #{client_ip}"

	elsif path == "/stylesheet.css"
		client.puts File.read('./stylesheet.css')
		puts "sent 'style.css' to #{client_ip}"
	elsif path == "/about"
		client.puts File.read('./about.html')
		puts "sent 'about.html' to #{client_ip}"
	elsif path == "/gryffindor"
		client.puts File.read('./gryffindor.html')
		puts "sent 'gryffindor.html' to #{client_ip}"

	elsif path == "/slytherin"
		client.puts File.read('./slytherin.html')
		puts "sent 'slytherin.html' to #{client_ip}"
	elsif path == "/DRACO_MALFOY.html"
		client.puts File.read('./DRACO_MALFOY.html')
		puts "sent 'DRACO_MALFOY.html' to #{client_ip}"
	elsif path == "/SALAZAR_SLYTHERIN.html"
		client.puts File.read('./SALAZAR_SLYTHERIN.html')
		puts "sent 'SALAZAR_SLYTHERIN.html' to #{client_ip}"
	elsif path == "/HARRY_POTTER.html"
		client.puts File.read('./HARRY_POTTER.html')
		puts "sent 'HARRY_POTTER.html' to #{client_ip}"
	elsif path == "/HERMIONE_GRANGER.html"
		client.puts File.read('./HERMIONE_GRANGER.html')
		puts "sent 'HERMIONE_GRANGER.html' to #{client_ip}"
		

	else
		client.puts "Error! Try Again!!"
		puts "Send Error to #{client_ip}"
	end

	puts "client #{client_ip} has disconnected"
	
	client.close
		
end