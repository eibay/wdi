require 'socket'
require 'pry'
require 'webrick'
require 'httparty'

server = TCPServer.new 2000

my_favorite_things = []

loop do 

client = server.accept
request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		index_html = File.read('./views/index.html')
		client.puts(index_html)

	elsif request.path == "/things" && request.request_method == "POST"
		things = request.body.split("=")[1].gsub("+", ' ')
		my_favorite_things << "<li><a href='/pictures?tag=#{things}'>#{things}</a></li>"

		things_html = File.read('./views/things.html')
		things_html = things_html.gsub('{{favorite_things}}', my_favorite_things.join(' '))

		client.puts(things_html)

	elsif request.path == "/things" && request.request_method == "GET"
		things_html = File.read('./views/things.html')
		things_html = things_html.gsub('{{favorite_things}}', my_favorite_things.join(' '))

		client.puts(things_html)

	elsif request.path == "/pictures" && request.method_method == "GET"
		tag = request.query_string.split("=")[1]
		instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")

		images = []
		instagram_api["data"].each do |x|
			images.push("<img src='")
		end

	end

	client.close
end
