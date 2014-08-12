require 'socket'
require 'pry'

server = TCPServer.new 2000
while true

	client = server.accept
	client_ip = client.remote_address.ip_address #gets client's ip address

	puts "Client has connected from #{client_ip}" 

	request = client.gets.chomp #gets first line of request header
	
	path = request.split(" ")[1] #gets path from request

	puts "Client #{client_ip} is attempting to reach #{path}."

	if path == "/"
		client.puts File.read('../views/index.html')
		puts "Sent index.html to #{client_ip}."
	elsif path == "/stylesheets/style.css" #must include this because after viewing
		#the html, the browser will go look for the stylesheet.  This will tell the
		#browser which path to take to find it. 
		client.puts File.read('../stylesheets/style.css')
		puts "Sent 'style.css' to #{client_ip}."
	elsif path == "/about"
		client.puts File.read('../views/about.html')
		puts "Sent 'about.html' to #{client_ip}."
	end

	puts "#{client_ip} has disconnected"

	client.close
end