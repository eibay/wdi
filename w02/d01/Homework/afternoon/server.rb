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

	if path == "/"
# <<<<<<< HEAD

	# client.puts File.read('./views/index.html')
	# puts "Sent 'index.html' to #{client_ip}"

	# elsif path == "/stylesheets/style.css"

	# client.puts File.read('/stylesheets/style.css')
	# puts "Sent 'style.css' to #{client_ip}"

	# elsif  path == "/about"

	# client.puts File.read('.views/about/about.html')
	# puts "Sent 'about.html' to #{client_ip}"

	# else

	# client.puts "ERROR! Try again."
	# puts "Sent ERROR to #{client_ip}"

# =======
		client.puts File.read('./views/index.html') 
		puts "Sent 'index.html' to #{client_ip}"
	elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}" 
	elsif path == "/about"
		client.puts File.read("./views/about.html")
		puts "Sent 'about.html' to #{client_ip}"
	elsif path == "/gryffindor"
		client.puts File.read("./views/gryffindor/gryffindor.html")
		puts "Sent 'gryffindor.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/bellatrix_lestrange"
		client.puts File.read("./views/STUDENT_NAME/bellatrix_lestrange.html")
		puts "Sent 'bellatrix_lestrange.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/draco_malfoy.html"
		client.puts File.read("./views/STUDENT_NAME/draco_malfoy.html")
		puts "Sent 'draco_malfoy.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/hermione_granger.html"
		client.puts File.read("./views/STUDENT_NAME/hermione_granger.html")
		puts "Sent 'hermione_granger.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/narcissa_malfoy.html"
		client.puts File.read("./views/STUDENT_NAME/narcissa_malfoy.html")
		puts "Sent 'narcissa_malfoy.html' to #{client_ip}"		
	elsif path == "/slytherin"
		client.puts File.read("./views/slytherin/slytherin.html")
		puts "Sent 'slytherin.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/ron_weasley.html"
		client.puts File.read("./views/STUDENT_NAME/ron_weasley.html")
		puts "Sent 'ron_weasley.html' to #{client_ip}"
	elsif path == "/STUDENT_NAME/harry_potter.html"
		client.puts File.read("./views/STUDENT_NAME/harry_potter.html")
		puts "Sent 'harry_potter.html' to #{client_ip}"		
		else
		client.puts "ERROR! Try again."
		puts "Send ERROR to #{client_ip}"			
# >>>>>>> 782600f8f77ca947b841b71c571daa6a3b950a44
	end

	puts "Client #{client_ip} has disconnected"

	client.close

# <<<<<<< HEAD
# =======

# >>>>>>> 782600f8f77ca947b841b71c571daa6a3b950a44
end