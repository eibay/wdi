require 'socket'

server = TCPServer.new 2000


while true

	client = server.accept
	client_ip = client.remote_address.ip_address

	request = client.gets.chomp

	path = request.split(" ")[1]

	if path == "/"
		client.puts File.read("./views/facewarts_main.html")

	elsif path == "/house_gryffindor"
		client.puts File.read("./views/house_gryffindor.html")
	# elsif path == "/images/logo_gryffindor.jpg"
	# 	client.puts File.read("./images/logo_gryffindor.jpg")
		elsif path == "/g1.html"
			client.puts File.read("./views/g1.html")
		elsif path == "/g2.html"
			client.puts File.read("./views/g2.html")		
		elsif path == "/g3.html"
			client.puts File.read("./views/g3.html")	




	elsif path == "/house_slytherin"
		client.puts File.read("./views/house_slytherin.html")
	# elsif path == "/images/logo_slytherin.jpg"
	# 	client.puts File.read("./images/logo_slytherin.jpg")
		elsif path == "/s1.html"
			client.puts File.read("./views/s1.html")
		elsif path == "/s2.html"
			client.puts File.read("./views/s2.html")		



	elsif path == "/style.css"
		client.puts File.read("./views/style.css")
	

	end

	puts "Client #{client_ip} is attempting to reach #{path}"

	client.close
	
	puts "Client #{client_ip} has disconnected"
	

end