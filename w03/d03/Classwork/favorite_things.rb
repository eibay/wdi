require 'pry'
require 'socket'
require 'webrick'
require 'httparty'


server = TCPServer.new 2000
things = []
images =[]

loop  do
	
	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

if request.path == "/" && request.request_method == "GET"
	html= File.read('./views/index.html')
	client.puts html

elsif request.path == "/style.css"
	css = File.read('./stylesheets/style.css')
	client.puts css

elsif request.path =="/things" && request.request_method == "GET"
	html = File.read('./views/things.html')
	html = html.gsub("{{things}}", things.join(", "))
	client.puts html


elsif request.path.include?("/images") && request.request_method =="GET"
	
		html = File.read('./views/images.html')
		tag = request.query["tag"]
		images = []
			
		
			response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
		
			i = 0
			while i < response["data"].length
			images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
			i +=1
			end

		html = html.gsub("{{tag}}", tag)
		html = html.gsub("{{images}}", images.join(""))
		client.puts html



elsif request.path =="/things" && request.request_method == "POST"

	thing = request.query["thing"]

	#thing = request.body.split("=")[1]
	
	if thing.include?('+')
		thing = thing.gsub('+', " ")
		things.push("<a href='/images?tag=#{thing}'>#{thing}</a>")	
		html = File.read('./views/things.html')
		html = html.gsub("{{things}}", things.join(", "))
		client.puts html


	else
		things.push("<a href='/images?tag=#{thing}'>#{thing}</a>")

		html = File.read('./views/things.html')
		html = html.gsub("{{things}}", things.join(", "))
		client.puts html

	end

end

client.close

end

