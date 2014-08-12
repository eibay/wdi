require 'socket'

s = TCPServer.new 2000 

loop do 
	client = s.accept 
	puts "Client connected!"

	request = client.gets.chomp 
	path = request.split(' ')[1]
	puts "\tThey want #{path}!"

	if path == "/hello"
		t = Time.new.strftime "%l:%M%p"
 		client.puts "<h1>Hello! The time is #{t}!</h1>"
 		puts "sent them the hello page!"
 	elsif (path =~ /\/hello\/\w+/) == 0 
 		# this is what was wanted? 
 		name = path.split('/')[2]
 		client.puts "<h1>Hello, #{name}!</h1>" 
	elsif (path =~ /\/\w+/) == 0 
		# when requests, say, favicon.ico 
		# problem 
		str = "<h1>#{path.delete '/'}</h1>"
		client.puts str 
		puts "sent them #{str}"
	elsif path == '/'
		client.puts "<h1>Homepage</h1>"
		puts "sent them the home page!"
	else 
		client.puts "404 Not Found"
		puts "\tcouldn't send them stuff!"
	end 

	client.close 
end 