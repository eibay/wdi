require 'pry'
require 'socket'

server = TCPServer.new 2000

loop do

	
	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}."

	request = client.gets.chomp

	path = request.split(" ")[1]

	puts "Client #{client_ip} is attempting to reach #{path}."

	
	if path == "/"
		client.puts File.read('./views/index.html')
		puts "Sent 'index.html' to #{client_ip}."
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}."
	elsif path == "/about"
		client.puts File.read('./views/about.html')
		puts "Sent 'about.index' to #{client_ip}."
	elsif path == "/gryffindor"
		client.puts File.read('./views/gryffindor/gryffindor.html')
		puts "Sent 'gryffindor.html' to #{client_ip}."
	elsif path == "/slytherin"
		client.puts File.read('./views/slytherin/slytherin.html')
		puts "Sent 'slytherin.html' to #{client_ip}."
	elsif path == "/gryffindor/harrypotter"
		client.puts File.read('./views/gryffindor/harrypotter.html')
		puts puts "Sent 'harrypotter.html' to #{client_ip}."
	elsif path == "/gryffindor/hermionegranger"
		client.puts File.read('./views/gryffindor/hermionegranger.html')
		puts "Sent 'hermionegranger.html' to #{client_ip}."
	elsif path == "/slytherin/dracomalfoy"
		client.puts File.read('./views/slytherin/dracomalfoy.html')
		puts "Sent 'dracomalfoy.html' to #{client_ip}."
	elsif path == "/slytherin/gregorygoyle"
		client.puts File.read('./views/slytherin/gregorygoyle.html')
		puts "Sent 'gregorygoyle.html' to #{client_ip}."
	else
		client.puts "ERROR! NOT FOUND"
		puts "Sent error message to #{client_ip}."
	end


	puts "Client #{client_ip} has disconnected."

	client.close




end