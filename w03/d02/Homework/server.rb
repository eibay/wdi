require 'webrick'
require 'socket'
require 'pry'
require 'rainbow'
require 'httparty'

server = TCPServer.new 2000
tags = []
saved_images = []

loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" 
		html = File.read("./views/index.html")
		client.puts html
		puts Rainbow("Sent client index.html").color("#E42529")

	elsif request.path == "/stylesheets/style.css"
		css = File.read("./stylesheets/style.css")
		client.puts css
		puts Rainbow("Sent client style.css").color("#E42529")

	elsif request.path == "/results" #&& request.request_method == "GET"
		insta = HTTParty.get("https://api.instagram.com/v1/tags/#{request.query["tag"]}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")

		images = []
		
		insta['data'].each do |i| 
			image = i['images']['standard_resolution']['url']
			images.push("<img src='#{image}'>
				<form action='/saved/images' method='POST'>
				<input type='hidden' name='image' value='#{image}'>
				<input type='submit' value='Save Image'></form><br>")
		end

		html = File.read("./views/results.html")
		html = html.gsub("{{images}}", images.join(''))
		html = html.gsub("{{tag}}", request.query["tag"])
		client.puts html 
		puts Rainbow("Sent client results.html").color("#E42529")

	elsif request.path == "/saved/tags" #&& request.request_method == "POST"
		tag = request.body.split('=')[1]
		unless tags.include?("<li><a href='/results?tag=#{tag}'>#{tag}</a></li>")
			tags.push("<li><a href='/results?tag=#{tag}'>#{tag}</a></li>")
		end

		# saved_tags = []
		# tags.each {|t| saved_tags.push("<li><a href='/results?tag=#{t}'>#{t}</a></li>")}
		
		html = File.read("./views/saved_tags.html")
		html = html.gsub("{{tags}}", tags.join(''))
		client.puts html	
		puts Rainbow("Search saved").color("#E42529")

	elsif request.path == "/saved/images" && request.request_method == "POST"
		image = request.query['image'] #request.body.split('=')[1]
		unless saved_images.include?("<li><img src='#{image}'></li>")
			saved_images.push("<li><img src='#{image}'></li>")
		end

		# saved_images = []
		# saved_photos.each {|i| saved_images.push("<li><img src='#{i}'></li>")}

		html = File.read("./views/saved_photos.html")
		html = html.gsub("{{saved_images}}", saved_images.join(''))
		client.puts html
		puts Rainbow("Image saved").color("#E42529")
	end

	client.close
	puts Rainbow("Client disconnected").color("#E42529")
end