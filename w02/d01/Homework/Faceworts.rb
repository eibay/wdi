require 'socket'
require 'pry'
server = TCPServer.new 2000

while true
	client = server.accept 
	client_ip = client.remote_address.ip_address 
	request = client.gets.chomp 
	path = request.split(" ")[1]
	puts "Client #{client_ip} is attempting to reach #{path}"
if path == "/" 
	client.puts File.read ('./views/index.html')
	puts "Sent index.html to #{client_ip}"
elsif path == "/Gryffindor"
	client.puts File.read("./views/Gryffindor.html")
	puts "Sent Gryffindow html to #{client_ip}"
elsif path =="/Slytherin"
	client.puts File.read("./views/Slytherin.html")
	puts "Sent Slytherin html to #{client_ip}"
elsif path =="/HARRY_POTTER"
	client.puts File.read("./views/HARRY_POTTER.html")
	puts "Sent HARRY_POTTER to #{client_ip}"
elsif path =="/HERMIONE_GRANGER"
	client.puts File.read("./views/HERMIONE_GRANGER.html")
	puts "Sent HERMIONE_GRANGER to #{client_ip}"
elsif path =="/DRACO_MALFOY"
	client.puts File.read("./views/DRACO_MALFOY.html")
	puts "Sent DRACO_MALFOY to #{client_ip}"
elsif path =="/SEVERUS_SNAPE"
	client.puts File.read("./views/SEVERUS_SNAPE.html")
	puts "Sent SEVERUS_SNAPE to #{client_ip}"
elsif path == "/stylesheets/style.css"
		client.puts File.read('./stylesheets/style.css')
		puts "Sent style.css to #{client_ip}"
elsif path == "/stylesheets/style1.css"
		client.puts File.read('./stylesheets/style1.css')
		puts "Sent style1.css to #{client_ip}"
elsif path == "/stylesheets/style2.css"
	client.puts File.read('./stylesheets/style2.css')
	puts "Sent style2.css to #{client_ip}"
		
else client.puts "ERROR"
	puts "Send Error"
	end



puts "Client #{client_ip} has disconnected"
client.close


end