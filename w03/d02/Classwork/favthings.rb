# require 'webrick'
# require 'socket'
# require 'httparty'
# require 'pry'

# server = TCPServer.new 2000
# array_things = []

# loop do
# 	client = server.accept
# 	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
# 	request.parse(client)

# if request.path == "/" && request.request_method == "GET"
#   html = File.read("./views/index.html")
#   client.puts(html)

#  # if request.path == "/things" && request.request_method == "GET"

# elsif request.path == "/" && request.request_method == "POST"
#   saved_hashtags = request.body.split("=")[1]
#   array_hashtag.push(saved_hashtags)
#   client.puts array_hashtag.join(", ")


# end
# client.close
# end

   
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
		html = File.read("./views/index.html"	)
		client.puts html
	elsif request.path == "/" && request.request_method == "POST"
		puppy_name = request.body.split("=")[1]
		puppies.push(puppy_name)
		client.puts puppies.join(", ")
	elsif request.path == "/tag"

	end

	client.close
end