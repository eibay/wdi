require 'socket'
require 'pry'
server = TCPServer.new 2000

while true
  
  client = server.accept
  client_ip = client.remote_address.ip_address
  puts "client address is #{client_ip}"

  request = client.gets.chomp
  path = request.split(" ")[1]
  puts "client #{client_ip} is attempting to reach #{path}."
if path == "/"

	client.puts File.read('./views/index.html')
	puts "sent index.html to #{client_ip}."

	path = request.split(" ")[1]
	elsif path == "/stylesheets/styles.css"
		client.puts File.read('stylesheets/styles.css')
		puts "sent styles.css to #{client_ip}"
	elsif path == "/gryffindor"
		client.puts File.read('./views/gryffindor.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/slytherin"
		client.puts File.read('./views/slytherin.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/minerva"
		client.puts File.read('./views/minerva.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/nicholas"
		client.puts File.read('./views/nicholas.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/severus"
		client.puts File.read('./views/severus.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/bloody"
		client.puts File.read('./views/bloody.html')
		puts "sent about.html to #{client_ip}"
	elsif path == "/hogwarts"
		client.puts File.read('./views/hogwarts.html')
		puts "sent about.html to #{client_ip}"
	else
		client.puts File.read('./views/404.html')
		puts "sent 404 to #{client_ip}"
	end

	

	

puts "client #{client_ip} has disconnected"
  client.close

end