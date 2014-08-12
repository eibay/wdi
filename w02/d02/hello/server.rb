require 'socket'
server = TCPServer.new 2000


while true
	#client connecting

	client = server.accept 

	#listen; getting input. 

	request = client.gets.chomp #request is the variable, is arbitrary
	puts "Client said: #{request}"
	path = request.split(" ")[1] #referring to the '/'

	# if talking

	if path == "/" #path is the variable, is arbitrary
		client.puts "<h1> index </h1>"
	elsif path == "/hello"
		client.puts "<h1> Hello! </h1>"
	end
	# client = server.accept
	# client.puts "HELLO!"
	client.close
end