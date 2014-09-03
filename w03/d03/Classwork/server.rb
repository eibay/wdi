require 'webrick'
require 'socket'
require 'pry'
require 'httparty'

server= TCPServer.new 2000

things = []

loop do
	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html
	elsif request.path == "/things" && request.request_method == "POST"
		thing = request.body.split("=")[1]
		things.push(thing)
		
		html = File.read('./views/things.html')

		things_html= []

		things.each do |thing|
			things_html.push("<li><a href='/pictures?tag=#{thing}'>#{things}</a></li>")
		end

		html = html.gsub("{{things}}", things.join(', '))
		client.puts(html)
	elsif request.path == "/things" && request.request_method == "GET"
		html = File.read('./views/things.html')
		html = html.gsub("{{things}}", things.join(', '))
		client.puts(html)
	elsif request.path == "/pictures" && request.request_method == "GET"
		tag = request.query_string.split("=")[1]
		instagram_pics = HTTParty.get("https:")
		images = []

		instagram_pics["data"].each do |pic|
			images.push("")
		html = File.read('./views/pictures.html')
	end

	client.close
end