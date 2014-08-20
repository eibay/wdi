require 'socket'
require 'httparty'
require 'webrick'
require'pry'

server=TCPServer.new 2000

	saved_tags=[]
	saved_images=[]


loop do
	client=server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	
	puts request.path

	
	if request.path=="/"
		client. puts File.read("index.html")
		if(saved_tags.any?)
			client.puts "<h1>Saved Tags</h1>"
		end
		saved_tags.each do |n|
			client.puts "<li><a href='./images/?tag_search=#{n}'>#{n}</a></li>"
		end

		if(saved_images.any?)
			client.puts"<h1><a href='./saved_images'>Review Your Saved Images</a></h1></body></html>"
		end
	elsif request.path=="/images/" && request.request_method=="GET"
		
		response=HTTParty.get("https://api.instagram.com/v1/tags/#{request.query['tag_search']}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")

		client.puts "<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body>"
		if(saved_tags.include? request.query['tag_search'])
			client.puts "You have already saved this tag, review a list of your saved tags <a href='..'>here</a></body></html>"
		else
			
			client.puts "<form action='/images/' method='POST'><input type='hidden' value='#{request.query['tag_search']}' name='the_tag'><input type='submit'value='Save Tag'></form><br />"
		end

	 	response["data"].each do |tag|
	 	# puts tag["images"]["standard_resolution"]["url"]
	 	image_url=tag["images"]["standard_resolution"]["url"]

	 	client.puts "<img src='#{image_url}' /><br /><form action='/saved_images/' method='POST'><input type='hidden' value='#{image_url.split('/')[5]}' name='image'><input type='submit'value='Save Image'></form><br />"
	 end

	client.puts "</body></html>"

	elsif request.path=="/images/" && request.request_method=="POST"
		
		client.puts"<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body>"
		client.puts "<h1>You saved this tag</h1>"
		client.puts "<h1>All tags</h1>"
		tag=request.body.split("=")[1]
		
		saved_tags.push(tag)
		client.puts
		saved_tags.each do |n|
			client.puts "<li><a href='./?tag_search=#{n}'>#{n}</a></li>"
		end
		client.puts "</ol><br /><a href='..'>Perform another search</a></body></html>"
	elsif request.path=="/saved_images/"&& request.request_method=="POST"
		client.puts"<html><head><link rel='stylesheet' type='text/css' href='./style.css'></head><body>"
		client.puts "<h1>You saved this image</h1>"
		

		image=request.body.split("=")[1]
		saved_images.push(image)

		saved_images.each do |n|
			client.puts "<img src='http://scontent-b.cdninstagram.com/hphotos-xfa1/t51.2885-15/#{n}' />"
		end
		client.puts"<a href='..'>Perform another search</a><br>"
		client.puts"</body></html>"
	
	elsif request.path=="/saved_images"
		client.puts"<body><head><link rel='stylesheet' type='text/css' href='./style.css'></head><html>"
		saved_images.each do |n|
			client.puts "<img src='http://scontent-b.cdninstagram.com/hphotos-xfa1/t51.2885-15/#{n}' />"
		end
		client.puts"<br><a href='..'>Perform another search</a></body></html>"
	elsif request.path=="/style.css"||request.path=="/images/style.css"||request.path=="/saved_images/style.css"
		css = File.read("./style.css")
		client.puts css
		

	end



	client.close
end