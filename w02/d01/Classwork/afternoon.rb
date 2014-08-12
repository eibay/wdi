require 'socket'
require 'pry'
server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address
	
	puts "Client from #{client_ip}"

	request = client.gets.chomp
	path = request.split(" ")[1]
	puts "Client #{client_ip} is attempting to reach #{path}."

#	binding.pry

	if path == "/"
		client.puts File.read('./views/index.html')
		puts "sent index.html to #{client_ip}"
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "sent 'style.css' to #{client_ip}"
	elsif path == "/about"
		client.puts File.read('./views/about.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/about"
		client.puts File.read('./views/gryffindor.html')
		puts "sent gryffindor.html to #{client_ip}"
	elsif path == "/about"
		client.puts File.read('./views/slytherin.html')
		puts "sent slytherin.html to #{client_ip}"
	# elsif path == "/cars"
	# 	client.puts "Welcome to Cars."
	# 	puts "sent welcome to cars to #{client_ip}"
	# else
	# 	client.puts "I dont know."
	# 	puts "sent i don't know to #{client_ip}"
	end	

	puts "client #{client_ip} has disconnected."
	
	client.close
end