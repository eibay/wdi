require 'socket'
require 'pry'
require 'httparty'
require 'webrick'
require 'uri'

server = TCPServer.new 2000
savedarray = []
newarray = []
loop do
	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP) #does the parsing for us
	request.parse(client) #parsing what we are getting from client and parsing makes the 
	#variable you are doing it on equal to that so dont need another variable

	if request.path == "/" && request.request_method == "GET"
		index = File.read("./views/index.html")
		client.puts index


	elsif request.path == "/tag"

		images = []
	
		
	tagsearch = request.query["tagwords"]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagsearch}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")

	response["data"].each do|x|
		results = x["images"]["standard_resolution"]["url"] 
		images << "<a href='#{results}'><img src='#{results}'></a>"
		#I am linking to image so when you click it gets bigger
	end

	results = File.read("./views/picture.html")
	results = results.gsub("{{picture}}", images.join(''))
	results = results.gsub("{{tagword}}", tagsearch)

	
	client.puts results
 

	elsif request.path == "/list" && request.request_method == "POST"
		
		

	listitems = request.body.split("=")[1]
	newarray << "<li><a href='/tag?tagwords=#{listitems}'>#{listitems}</a></li>"
					#because gets saves in the browser
				

		list = File.read("./views/list.html")

		list = list.gsub("{{list}}", newarray.join(''))

		client.puts list

	elsif request.path == "/style"
		css = File.read("./stylesheets/style.css")
		client.puts css

	else
	client.puts "ERROR!!"

	
	end
client.close
end