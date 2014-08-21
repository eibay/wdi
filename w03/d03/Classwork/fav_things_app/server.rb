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
			
			things_html = []
			things.each do |thing|
			things_html.push("<li><a href='pictures?tag=#{thing}'></a><li>")
	

			html = html.gsub("{{things}}", things_html.join(''))
			client.puts(html)
		end

	elsif request.path == "/things" && request.request_method == "GET"
		html
		client.puts "<h1>Your Favorite Things</h1>"
		client.puts "<h2>#{fav_things.join(', ')}</h2>"
	elsif request.path == "/pictures" && request.request_method == "GET"
		tag = request.query_string.split("=")[1]
		insta_pics = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
		images = []

		insta_pics








	end
	client.close
end