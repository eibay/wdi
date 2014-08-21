require 'pry'
require 'socket'
require 'webrick'
require 'httparty'

server = TCPServer.new 2000

favorite_things = []
favorite_page = []

loop do
	client = server.accept
	client_ip = client.remote_address.ip_address
	puts "Client has connected from #{client_ip}"
	
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read('./views/index.html')
		client.puts html
	elsif request.path == "/things" && request.request_method == "POST"
		tag = request.body.split("=")[1]
		favorite_things << "<li><a href='/pictures#{tag}'>#{tag}</a></li>"
		favorite_page = favorite_things.join(' ')

		html = File.read('./views/favorite.html')
		html = html.gsub("{{tag}}", favorite_page)

		client.puts html
	elsif request.path == "/things" && request.request_method == "GET"

		html = File.read('./views/favorite.html')
		html = html.gsub("{{tag}}", favorite_page)

		client.puts html
	end
	client.close
end