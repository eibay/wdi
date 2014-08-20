# ok, so i tested this program and by itself it saves the name of one puppy and you don't get an option to add more puppies to be saved

require 'webrick'
require 'socket'
require 'pry'

server = TCPServer.new 2000
puppies = []

loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)

	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html
	elsif request.path == "/" && request.request_method == "POST"
		puppy_name = request.body.split("=")[1]
		puppies.push(puppy_name)
		client.puts puppies.join(", ")

# binding.pry

	elsif request.path == "/tag"

	end

	client.close
end