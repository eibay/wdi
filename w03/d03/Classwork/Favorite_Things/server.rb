require 'pry'
require 'webrick'
require 'socket'
require 'httparty'

server = TCPServer.new 2000
things = []

loop do 

client = server.accept

request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)

if request.path == "/" && request.request_method == "GET"
	html = File.read("./index.html")
	client.puts html
	puts "Sent index.html to client"

elsif request.path == "/stylesheets/style.css"
	client.puts File.read('./stylesheets/style.css')
	put "Sent css to client"

elsif request.path == "/things" && request.request_method == "POST"
	thing = request.body.split("=")[1]
	things << thing
#binding.pry
	html = File.read('./things.html')
	html = html.gsub("{{things}}", things.join(','))
	client.puts html
	puts "Added a thing and showed list page to client"

elsif request.path == "/things" && request.request_method == "GET"
	html = File.read("./things.html")
	html = html.gsub("{{things}}", things.join(','))
	client.puts html
	puts "Sent view of list of things to client"

else
	client.puts "error"
	puts "error"
client.close
end
















	
end