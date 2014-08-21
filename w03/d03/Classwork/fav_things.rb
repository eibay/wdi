require 'socket'
require 'webrick'
require 'httparty'
require 'pry'

server = TCPServer.new 2000

things = []

loop do 

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/"
		html = File.read("./views/index.html")
		client.puts html
	elsif request.path == "/stylesheets/style.css"
		css = File.read("./stylesheets/style.css")
		client.puts css
	elsif request.path == "/pictures"
		insta = HTTParty.get("https://api.instagram.com/v1/tags/#{request.query['tag']}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
		
		images = []
		insta['data'].each {|i| images.push("<li><img src='#{i['images']['standard_resolution']['url']}'></li>")}

		html = File.read("./views/pictures.html")
		html = html.gsub("{{pictures}}", images.join(''))
		client.puts html

	elsif request.path == "/things" && request.request_method == "GET"
		html = File.read("./views/things.html")
		html = html.gsub("{{things}}", things.join(''))
		client.puts html

	elsif request.path == "/things" && request.request_method == "POST"
		thing = request.body.split("=")[1]
		thing = thing.split("+")
		thing = thing.join(' ')
		things.push("<li><a href='/pictures?tag=#{thing}'>#{thing}</a></li>")

		# things_html.push("<li><a href='/pictures?tag=#{thing}>#{thing}</a></li>")

		html = File.read("./views/things.html")
		html = html.gsub("{{things}}", things.join(''))
		client.puts html
	end

	client.close
end