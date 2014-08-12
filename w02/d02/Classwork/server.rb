require 'socket'

s = TCPServer.new 2000 

loop do 
	client = s.accept 
	puts "Client connected!"

	request = client.gets.chomp 
	path = request.split(' ')[1]
	puts "\tThey want #{request}!"

	if path == "/hello"
		t = Time.new.strftime "%I:%M %p"
 		client.puts "<h1>Hello! It's #{t}</h1>"
	elsif (path =~ /\/\w+/) == 0 
		client.puts "<h1>#{path.delete('/')}</h1>"
	elsif path == "/"
		client.puts "<h1>Homepage</h1>"
	else 
		client.puts "404 Not Found"
	end 

	client.close 
end 