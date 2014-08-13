require 'socket'
require 'pry'

server = TCPServer.new 2000

while true

	client = server.accept 	
	client_ip = client.remote_address.ip_address


	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

	path = request.split(" ")[1]

	puts "Client #{client_ip} is attempting to reach #{path}."

	# binding.pry

	if path == "/"
		client.puts File.read('./views/index.html') 
		puts "Sent 'index.html' to #{client_ip}."
	
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')		
		puts "Sent 'style.css' to #{client_ip}"
	
	elsif path == "/about.html"
		client.puts File.read ('./views/about.html')
		puts "Sent 'about.html' to #{client_ip}"


	elsif path == "/gryffindor.html"
		client.puts File.read ('./views/gryffindor.html')
		puts "Sent 'gryffindor.html' to #{client_ip}"


	elsif path == "/slytherin.html"
		client.puts File.read ('./views/slytherin.html')
		puts "Sent 'slytherin.html' to #{client_ip}"

	elsif path == "/dumbledoor.html"
		client.puts File.read ('./views/dumbledoor.html')
		puts "Sent 'dumbledoor.html' to #{client_ip}"

	#dumbledoor.html

	elsif path == "/professorslytherin.html"
		client.puts File.read ('./views/professorslytherin.html')
		puts "Sent 'professorslytherin.html' to #{client_ip}"
	#professorslytherin.html

end
		puts "Client #{client_ip} has disconnected."
	
	client.close

end
