require 'erb'
require 'socket'
require 'httparty'

# use port 2000 for internal testing 
port = 2000 

s = TCPServer.new port  

loop do 
	c = s.accept 

	# get the route from the HTTP header 
	r = c.gets.chomp
	r = r.split ' '
	r = r[1]

	if r == '/'
		f = File.read "./views/home/index.html"
		c.puts f 
	else 
		c.puts "<h1>404 Not Found</h1>"
	end 

	c.close 
end 