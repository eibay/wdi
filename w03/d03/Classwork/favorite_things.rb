require 'webrick'
require 'socket'
require 'pry'

server = TCPServer.new 2000

favorite_things[]

loop do 

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html


	elsif request.path == "/things" && request.request_method == "Post"
		thing = request.body.split("=")[1]
		thing.push(thing)

	html = File.read('./views/things.html')
	html = 


	end
	client.close
end