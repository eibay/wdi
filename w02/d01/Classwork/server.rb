require 'socket'
require 'pry'


server = TCPServer.new 2000

while true

	client = server.accept
	client_ip = client.remote_address.ip_address


	puts "Client has connected from #{client_ip}."
	# client.puts "Haha! I've discovered your IP address! It is: #{client_ip}!"


	request = client.gets.chomp

	path = request.split(" ")[1]

	if path == "/"
		client.puts File.read("./views/index.html")
		puts "sent index.html to #{client_ip}"
	elsif path == "/stylesheets.css"
		client.puts File.read("./views/stylesheets.css")
		puts "Sent stylesheets.css to #{client_ip}"
	elsif path == "/about.html"
		client.puts File.read("./views/about.html")
		puts "Sent about.html to #{client_ip}"
		

		

	end



	puts "Client #{client_ip} is attempting to reach #{path}"

# ###############
# binding.pry #######################################
# ###############
	puts "Client #{client_ip} has disconnected"
	
	client.close
end

