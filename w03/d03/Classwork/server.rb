require 'socket'
server = TCPServer.new 2000
require 'WEBrick'
require 'httparty'
items = []

loop do
	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html
	elsif request.path == "/favoritethings" && request.request_method == "POST"
		favitems =[]
		items << item = request.body.split("=")[1].gsub("+"," ") #to get ride of plus
	# signs when using two words or can use request.query cause takes it out for us
		
		items.each do |x|
			favitems << "<li><a href='/favoritethings?favoriteitem=#{item}'>#{item}</a></li>"
		end
		results = File.read("./views/results.html")
		results = results.gsub("{{list}}", favitems.join(''))
		client.puts results
	elsif request.path == "/favoritethings" && request.request_method == "GET"
		tag = request.query_string.split("=")[1]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
		images = []
		response["data"].each do|pic|
			images << "<img src='#{pic["images"]["standard_resolution"]["url"]}' />"
		end
		results1 = File.read("./views/results.html")
		results1 = results1.gsub("{{list}}", images.join(''))
		client.puts results1
	
	end
client.close
end