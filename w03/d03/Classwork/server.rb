require 'pry'
require 'socket'
require 'WEBrick'

server = TCPServer.new 2000
favThings = ""

loop do
	
client = server.accept
request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts request.path

if request.path == "/" && request.request_method == "GET"
	html = File.read('./views/index.html')
	client.puts(html)
elsif request.path == "/things" && request.request_method == "POST"
	if request.body.split("=")[1].include?("+")
		tings = request.body.split("=")[1].gsub('+', " ")
		favThings<<"<li>#{tings}</li>"
	else
	favThings<<"<li>#{request.body.split("=")[1]}</li>"
	end
	html = File.read('./views/things.html')
	html = html.gsub('{{things}}', favThings)
	client.puts(html)
elsif request.path == "/styles/stylesheet.css"
	css = File.read('./styles/stylesheet.css')
	client.puts(css)
end
client.close
end