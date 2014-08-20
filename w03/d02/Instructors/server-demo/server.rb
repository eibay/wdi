require 'webrick'
require 'socket'
require 'pry'

server = TCPServer.new 2000
puppies = []

loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)
	binding.pry

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html"	)
		client.puts html
	elsif request.path == "/" && request.request_method == "POST"
		binding.pry
		puppy_name = request.body.split("=")[1]
		puppies.push(puppy_name)
		client.puts puppies.join(", ")
	elsif request.path == "/tag"

	end

	client.close
end