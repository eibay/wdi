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
	elsif path == "/views/images/logo_gryffindor.jpg"
		client.puts File.read("./views/images/logo_gryffindor.jpg")
		elsif path == "/g1.html"
			client.puts File.read("./views/g1.html")
		elsif path == "/g2.html"
			client.puts File.read("./views/g2.html")		
		elsif path == "/g3.html"
			client.puts File.read("./views/g3.html")	

		elsif path == "/images/g1.jpg"
			client.puts File.read("./views/images/g1.jpg")
		elsif path == "/images/g2.jpg"
			client.puts File.read("./views/images/g2.jpg")	
		elsif path == "/images/g3.jpg"
			client.puts File.read("./views/images/g3.jpg")
		elsif path == "/images/g4.jpg"
			client.puts File.read("./views/images/g4.jpg")
		elsif path == "/images/g5.jpg"
			client.puts File.read("./views/images/g5.jpg")

			




	elsif path == "/house_slytherin"
		client.puts File.read("./views/house_slytherin.html")
	elsif path == "/views/images/logo_slytherin.jpg"
		client.puts File.read("./views/images/logo_slytherin.jpg")
		elsif path == "/s1.html"
			client.puts File.read("./views/s1.html")
		elsif path == "/s2.html"
			client.puts File.read("./views/s2.html")	

		elsif path == "/images/s1.jpg"
			client.puts File.read("./views/images/s1.jpg")
		elsif path == "/images/s2.jpg"
			client.puts File.read("./views/images/s2.jpg")	
		elsif path == "/images/s3.jpg"
			client.puts File.read("./views/images/s3.jpg")
		elsif path == "/images/s4.jpg"
			client.puts File.read("./views/images/s4.jpg")
		elsif path == "/images/s5.jpg"
			client.puts File.read("./views/images/s5.jpg")	





	elsif path == "/style.css"
		client.puts File.read("./views/style.css")
	

	end

	puts "Client #{client_ip} is attempting to reach #{path}"

	client.close
	
	puts "Client #{client_ip} has disconnected"
	

end