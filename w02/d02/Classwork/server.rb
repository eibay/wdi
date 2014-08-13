require 'socket'

s = TCPServer.new 2000 

loop do 
	users = %w(monkey jeff severus)
	client = s.accept 
	puts "Client connected!"

	request = client.gets.chomp 
	path = request.split(' ')[1]
	
	a = path.split '/'
	name = a[2] # WARNING: will be nil for /hello 
	# so have the tests be in the right place 

	puts "\tThey want #{path}!"

	if path == "/hello"
		t = Time.new.strftime "%l:%M%p"
 		client.puts "<h1>Hello! The time is #{t}!</h1>"
 		puts "sent them the hello page!"
 	elsif a[1] == "hello" && users.include?(name) 
 		name.capitalize! 
 		client.puts "<h1>Hello, #{name}!</h1>" 
 	elsif a[1] == "hello" && !users.include?(name)
 		name.capitalize! 
 		client.puts "<h1>You aren't included in the users array, #{name}. Feel free to sign up.</h1>" 
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