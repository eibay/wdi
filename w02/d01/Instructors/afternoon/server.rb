require 'socket'
require 'pry'

server = TCPServer.new 2000

while true
<<<<<<< HEAD
	
=======

>>>>>>> b44a8e59e87c3efd22507583545fef8d8ef071f4
	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

<<<<<<< HEAD
	path = request.split(" ")[1] 

	puts "Client #{client_ip} is attempting to reach #{path}"    

	if path == "/"
		client.puts File.read('./views/index.html')
		puts "Sent 'index.html' to #{client_ip}"

	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css to #{client_ip}"

	elsif path == "/about"
		client.puts File.read('./views/about.html')
		puts "Sent 'about.html' to #{client_ip}" 

	elsif path == "/gryffindor"
		client.puts File.read('./views/gryffindor.html')
		puts "Sent 'gryffindor.html' to #{client_ip}"

	elsif path == "/slytherin"
		client.puts File.read('./views/slytherin.html')
		puts "Sent 'slytherin.html' to #{client_ip}"

	elsif path == "/peter_pettigrew"
		client.puts File.read('./views/peter_pettigrew.html')
		puts "Sent 'peter_pettigrew.html' to #{client_ip}"

	elsif path == "/rubeus_hagrid"
		client.puts File.read('./views/rubeus_hagrid.html')
		puts "Sent 'rubeus_hagrid.html' to #{client_ip}"

	elsif path == "/tom_marvolo_riddle"
		client.puts File.read('./views/tom_marvolo_riddle.html')
		puts "Sent 'tom_marvolo_riddle.html' to #{client_ip}"

	elsif path == "/severus_snape"
		client.puts File.read('./views/severus_snape.html')
		puts "Sent 'severus_snape.html' to #{client_ip}"
	else
		client.puts "ERROR! try again."
		puts "Send ERROR to #{client_ip}"
=======
	path = request.split(" ")[1]

	puts "Client #{client_ip} is attempting to reach #{path}"

	if path == "/"
		client.puts File.read('./views/index.html') 
		puts "Sent 'index.html' to #{client_ip}"
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}" 
	elsif path == "/about"
		client.puts File.read("./views/about.html")
		puts "Sent 'about.html' to #{client_ip}"
		else
		client.puts "ERROR! Try again."
		puts "Send ERROR to #{client_ip}"			
>>>>>>> b44a8e59e87c3efd22507583545fef8d8ef071f4
	end

	puts "Client #{client_ip} has disconnected"

<<<<<<< HEAD

	client.close
=======
	client.close


>>>>>>> b44a8e59e87c3efd22507583545fef8d8ef071f4
end