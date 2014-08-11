require 'socket'
server = TCPServer.new 2000
while true
	client = server.accept

	puts "Client connected"

	client.puts "<h1>Hello World!</h1> <h4>Smaller header</h4> <a href='http://www.nastassiacarmona.com'>This is a link</a> <br />#{1+4}"
	
	client.gets.chomp

	client.close
end