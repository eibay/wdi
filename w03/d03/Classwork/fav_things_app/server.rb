require 'webrick'
require 'pry'
require 'socket'

server = TCPServer.new 2000

fav_things = []
	
loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		client.puts File.read("./views/main.html")
	elsif request.path == "/things" && request.request_method == "POST"
		fav_thing = request.body.split("=")[1]
		
		if fav_things.include?(fav_thing)
			client.puts "<h1>WHOOOOOAAAAHHH!!</h1>"
			client.puts "<h1>YOU ADDED THAT ALREADY!!</h1>"
		else
			fav_things.push(fav_thing)
			client.puts "<h1>You have added:</h1>"
			client.puts "<h1>#{fav_things.last}</h1>"
		end

	elsif request.path == "/things" && request.request_method == "GET"
		client.puts "<h1>Your Favorite Things</h1>"
		client.puts "<h2>#{fav_things.join(', ')}</h2>"









	end
	client.close
end