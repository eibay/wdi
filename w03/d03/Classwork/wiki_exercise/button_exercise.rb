require 'httparty'
require 'webrick'
require 'pry'

server = TCPServer.new 2000
saved_links = []


while true
	client = server.accept
	p "client connected"	######################################################
 	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
 	p "client's request is WEBricked" ######################################################
	request.parse(client)

	if request.path == "/"
		p "client requests request.path: #{request.path}"
		client.puts File.read("./views/index.html")

	elsif request.path == "/search" && request.request_method == "GET"
		p "client requests request.path: #{request.path}" #####################################################
		searched_topic = request.query["topic"] 
		p "client requests request.query: #{request.query}" #####################################################
		# topic = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=Main%20Page&prop=revisions&rvprop=content")	
		topic = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=#{searched_topic}&prop=revisions&rvprop=content")
		topic = HTTParty.get("http://en.wikipedia.org/w/api.php?format=json&action=query&titles=octopus&prop=revisions&rvprop=content")

		topic = topic["query"]["pages"]["22780"]["revisions"][0]["*"]
		p "topic: #{topic}"
		
		html = File.read("./views/index.html")
		html = html.gsub("{{CONTENT}}", topic)

		client.puts html

	elsif request.path == "/search" && request.request_method == "POST"
		searched_topic = request.body.split("=")[1]
		p "request.body = #{request.body}"

		saved_links << searched_topic


		client.puts "<p> hello </p>"
		# topic["query"]["pages"]["22780"]["pageid"]

	end
	client.close
end