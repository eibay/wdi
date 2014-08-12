require 'socket'
require 'pry'



server= TCPServer.new 2003

while true

	client=server.accept
    client_ip=client.remote_address.ip_address

	puts "Client has connected from #{client_ip}"

	request=client.gets.chomp

	path=request.split(" ")[1]
 	puts path
 	puts "Client #{client_ip} is trying to reach #{path}"
 	if(path=="/")
 	
 		client.puts File.read('./views/index.html')
 		puts "Sent index.html page to #{client_ip}"
  	 elsif(path=="/about")
  	 	client.puts File.read('./views/about.html')
  	 	puts "Sent about.html page to #{client_ip}"
  	 elsif(path== "/stylesheets/style.css")
  	 	client.puts	File.read("./views/stylesheets/style.css")
  	 	puts "Sent stylesheet to #{client_ip}"
  	 else
  	 	client.puts"This page does not exist."
  	 	puts"Sent error to #{client_ip}"

  	 
  	 end

 	puts "Client #{client_ip} has disconnected"
 



	client.close
end