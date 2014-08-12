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
	elsif path == "/about"
		client.puts File.read('./views/about.html')
		puts "sent about.html to #{client_ip}"
	else
		client.puts "404"
		puts "sent 404 to #{client_ip}"
	end

	

	

puts "client #{client_ip} has disconnected"
  client.close

end