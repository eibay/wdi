require 'webrick'
require 'socket'
require 'pry'

server = TCPServer.new 2000

loop do
	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" 
		html = File.read("./views/index.html")
		client.puts html

	elsif request.path == "/things" && request.request_method == "GET"
		html = File.read("./views/things.html")
		client.puts html

	elsif request.path == "/things" && request.request_method == "POST"	
		html = File.read("./views/things.html")
		client.puts html
		
	end

	client.close
	
end