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
     elsif(path=="/gryffindor")
      client.puts File.read('./views/gryffindor.html')
      puts "Sent gryffindor.html page to #{client_ip}"
      elsif(path=="/slytherin")
      client.puts File.read('./views/slytherin.html')
      puts "Sent slytherin.html page to #{client_ip}"
    elsif(path=="/HARRY_POTTER")
      client.puts File.read('./views/harrypotter.html')
      puts "Sent harrypotter.html page to #{client_ip}"
    elsif(path=="/RON_WEASLEY")
      client.puts File.read('./views/ronweasley.html')
      puts "Sent ronweasley.html page to #{client_ip}"
    elsif(path=="/DRACO_MALFOY")
      client.puts File.read('./views/dracomalfoy.html')
      puts "Sent dracomalfoy.html page to #{client_ip}"
    elsif(path=="/VINCENT_CRABBE")
      client.puts File.read('./views/vincentcrabbe.html')
      puts "Sent vincentcrabbe.html page to #{client_ip}"


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