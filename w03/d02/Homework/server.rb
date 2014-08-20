require 'webrick'
require 'socket'
require 'pry'
require 'httparty'

server = TCPServer.new 2000
tags = []
loop do 

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	

	
	# if request.path == "/" && request.request_method == "GET"
	# 	html = File.read('./views/index.html')
	# 	client.puts html


	# elsif request.path == "/style.css"
	# 	css = File.read('./stylesheets/style.css')
	# 	client.puts css

	# elsif request.path.include?("/search") && request.request_method == "GET"

	# 	html = File.read('./views/search-page.html')
	# 	tag = request.query["tag"]
	# 	images = []
			
	# 		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
	# 		i = 0
	# 		while i < response["data"].length
	# 		images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
	# 		i +=1
	# 		end

	# 	html = html.gsub("{{tag}}", tag)
	# 	html = html.gsub("{{images}}", images.join(""))
	# 	client.puts html


	# elsif request.path.include?("/search/save") && request.request_method == "POST"
	# 		html = File.read('./views/saved-search.html')
	# 		#html.gsub("{{tags}}", tag)
	# 		client.puts html




	if request.path == "/" && request.request_method == "GET"

		html = File.read('./views/index.html')
		client.puts html


	elsif request.path == "/style.css"
		css = File.read('./stylesheets/style.css')
		client.puts css


	elsif request.path == "/search" && request.request_method == "POST"

		html = File.read('./views/search-page.html')
		tag = request.body.split("=")[1]
		
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

	elsif request.path == "/search/save" && request.request_method == "POST"

		tag = request.body.split("=")[0]
		tags.push("<a href='/search'>tag</a>")
		html = File.read('./views/saved-search.html')
		html = html.gsub("{{tags}}", tags.join(', '))
		client.puts html


	end


client.close

end
