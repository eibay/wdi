require 'socket'
require 'pry'

server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

	path = request.split(" ")[1]

	puts "Client #{client_ip} is attempting to reach #{path}"




	# def path_taken(path, client, client_ip, destination, html_file, file)
	# 	if path == destination
	# 		return client.puts File.read(html_file)
	# 		return puts "Sent file to #{client_ip}"
	# 	else
	# 		client.puts "ERROR! Try again."
	# 		puts "Send ERROR to #{client_ip}"			
	# 	end 
	# end 

	# path_taken(path, client, client_ip, "/", "./views/index.html", 'index.html')

	# path_taken(path, client, client_ip, "/stylesheets/style.css", "./stylesheets/style.css", 'style.css')

	# path_taken(path, client, client_ip, "/about", "./views/about", 'about.html')

	# path_taken(path, client, client_ip, "/gryffindor", "./views/gryffindor", 'gryffindor.html')

	# path_taken(path, client, client_ip, "/slytherin", "./views/slytherin", 'slytherin.html')

	# path_taken(path, client, client_ip, "/harry_potter", "./views/harry_potter", 'harry_potter.html')

	# path_taken(path, client, client_ip, "/ronald_weasley", "./views/ronald_weasley", 'ronald_weasley.html')

	# path_taken(path, client, client_ip, "/draco_malfoy", "./views/draco_malfoy", 'draco_malfoy.html')

	# path_taken(path, client, client_ip, "/vincent_crabbe", "./views/vincent_crabbe", 'vincent_crabbe.html') 

	if path == "/"
		client.puts File.read('./views/index.html') 
		puts "Sent 'index.html' to #{client_ip}"
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}" 
	elsif path == "/about"
		client.puts File.read("./views/about.html")
		puts "Sent 'about.html' to #{client_ip}"
	elsif path == "/gryffindor"
		client.puts File.read("./views/gryffindor.html")
		puts "Sent 'gryffindor.html' to #{client_ip}"
	elsif path == "/slytherin"
		client.puts File.read("./views/slytherin.html")
		puts "Sent 'slytherin.html' to #{client_ip}"
	elsif path == "/harry_potter"
		client.puts File.read("./views/harry_potter.html")
		puts "Sent 'harry_potter.html' to #{client_ip}"
	elsif path == "/ronald_weasley"
		client.puts File.read("./views/ronald_weasley.html")
		puts "Sent 'ronald_weasley.html' to #{client_ip}"
	elsif path == "/draco_malfoy"
		client.puts File.read("./views/draco_malfoy.html")
		puts "Sent 'draco_malfoy.html' to #{client_ip}"
	elsif path == "/vincent_crabbe"
		client.puts File.read("./views/vincent_crabbe.html")
		puts "Sent 'vincent_crabbe.html' to #{client_ip}"
	else
		client.puts "ERROR! Try again."
		puts "Send ERROR to #{client_ip}"			
	end

	puts "Client #{client_ip} has disconnected"

	client.close


end