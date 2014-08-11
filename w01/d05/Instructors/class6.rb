require 'socket'
server = TCPServer.new 4000

while true
  client = server.accept

  puts "Client connected!"

  client.puts "
  	<h1> Iris Website </h1>
  
  	<h4>Smaller Header</h4> 
   <a href ='http://10.197.79.113:2000'> this is a link </a> "

  	client.gets.chomp

  client.close
end
