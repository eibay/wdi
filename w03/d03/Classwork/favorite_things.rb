require "socket"
require "pry"
require "webrick"


server = TCPServer.new 2000
favorite_list = []

loop do 
	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/"

		html = File.read('./views/index.html')
		client.puts html
		puts "Client has accessed home page"

	elsif request.path == "/saved" && request.request_method=="POST"
		favorite_things = request.body.split("=")[1]
		favorite_list.push(favorite_things)
		
		html = File.read('./views/saved.html')
		
		favorite_list2= []
		
		favorite_list.each do |a|
			favorite_list2.push "<li> #{a} </li>"
		end
		
		html = html.gsub("{{favorite}}", favorite_list2.join(" "))
		client.puts html

	elsif request.path == "/saved" && request.request_method=="GET"
		favorite_list.push(favorite_things)
		favorite_list.join(", ")
		html = File.read('./views/saved.html')
		html = html.gsub("{{favorite}}", favorite_list)
		client.puts html


	end
client.close
end
