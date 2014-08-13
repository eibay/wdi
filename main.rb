require 'socket'
server = TCPServer.new 2000

while true
  client = server.accept

  puts "Client connected!"

client.puts "<html>
				<h1>HHHHHHHH</h1> 
				<h2>eeeeee</h2> 
				<h3>llllllll</h3> 
				<h4>llllll</h4> 
				<h5>ooooooo</h5> 
				<h6><i>!!!!!</i></h6>  
				<a href='http://10.32.126.134:2000'>this is a link</a>
			</html>"

	client.gets chomp

	client.close
end