require 'socket'
require 'pry'

server = TCPServer.new 2000

while true

	client = server.accept #
	client_ip = client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request = client.gets.chomp

	path = request.split(" ")[1]

	puts "Client #{client_ip} is attempting to reach #{path}"

	
if path == "/"

	client.puts File.read('./views/index.html')
	puts "Sent 'index.html' to #{client_ip}"

elsif path == "/stylesheets/style.css"
	client.puts File.read('./stylesheets/style.css')
	puts "Sent 'style.css' to #{client_ip}"

elsif path == "/gryff_harry_potter.html"
	client.puts File.read('./views/gryff_harry_potter.html')
	puts "Sent 'gryff_harry_potter' to #{client_ip}"

elsif path == "/gryff_hermione_granger.html"
	client.puts File.read('./views/gryff_hermione_granger.html')
	puts "Sent 'gryff_hermione_granger' to #{client_ip}"

elsif path == "/gryff_ron_weasley.html"
	client.puts File.read('./views/gryff_ron_weasley.html')
	puts "Sent 'gryff_ron_weasley' to #{client_ip}"

elsif path == "/sly_draco_malfoy.html"
	client.puts File.read('./views/sly_draco_malfoy.html')
	puts "Sent 'sly_draco_malfoy' to #{client_ip}"

elsif path == "/sly_gregory_goyle.html"
	client.puts File.read('./views/sly_gregory_goyle.html')
	puts "Sent 'sly_gregory_goyle' to #{client_ip}"

elsif path == "/sly_pansy_parkinson.html"
	client.puts File.read('./views/sly_pansy_parkinson.html')
	puts "Sent 'sly_pansy_parkinson' to #{client_ip}"


else
client.puts "ERROR! Try again."
puts "Send Error to #{client_ip}"

	


end

puts "Client #{client_ip} has disconnected."


	client.close


end