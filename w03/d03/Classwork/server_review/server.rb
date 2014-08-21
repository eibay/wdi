require 'socket'
require 'httparty'
require 'webrick'
require'pry'
require 'rainbow'

server=TCPServer.new 2000

favorite_things=[]

loop do
	client=server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

if(request.path=="/")
	client.puts File.read("./index.html")
	if(favorite_things.any?)
		client.puts 	"<a href='./things'>See your favorite things</a></html></body>"
	else
		client.puts "</html></body>"
	end

elsif(request.path=="/things")&&(request.request_method=="GET")
	client.puts"<html><body>"
	if(favorite_things.any?)
	favorite_things.each do |n|
		client.puts "#{n}<br>"
	end
	client.puts "<br><a href='..'>Add another Thing</a></body></html>"
else
	client.puts "You have no favorite things yet"
	client.puts"<br><a href='..'>Add a thing</a></body></html>"
end
elsif(request.path=="/things")&&(request.request_method=="POST")

	thing=request.body.split("=")[1]
	thing=thing.split("+")
	thing=thing.join(' ')

	favorite_things.push(thing)
	client.puts"<html><body>"
	favorite_things.each do |n|
		client.puts "<a href=/things_pictures?tag=#{n}>#{n}</a><br>"
	end
	client.puts"<br><a href='..'>Add another Thing</a></body></html>"

elsif(request.path=="/things_pictures")&&(request.request_method=="GET")
	response=HTTParty.get("https://api.instagram.com/v1/tags/#{request.query['tag']}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
	client.puts "<html><body>"
	response["data"].each do |tag|
	 
	 	image_url=tag["images"]["standard_resolution"]["url"]

	 	client.puts "<img src='#{image_url}' /><br>"
	 end
	 client.puts "</body></html>"
end
	client.close
end
