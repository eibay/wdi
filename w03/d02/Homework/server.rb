require "webrick"
require "socket"
require "pry"
require "httparty"


server = TCPServer.new 2000
tags = []

loop do

	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)


	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts html

			
	elsif request.path.split("?")[0] == "/search" 
		tag = request.query["tag_search"]
		tag_request = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d")
		images=[]
		tag_request["data"].each do |a|
			images.push a["images"]
		end

		formatted_images = []
		images.each do |a|
			formatted_images.push "<img src='" + a["low_resolution"]["url"] + "' alt=''>" #<form action= '/saved_searches' ><input type = 'hidden' name='tag_search' value= ' '= ><button>Save Image</button></form>"
		end

		formatted_images_join = formatted_images.join(" ")
		html = File.read("./views/search_results.html")
		html = html.gsub('{{images}}', formatted_images_join)
		html = html.gsub("{{word}}", tag)
		client.puts html

		elsif request.path == "/saved" && request.request_method == "POST"	
		saved_tags = request.body.split("=")[0]
		tags.push(saved_tags)
	
		tags2 = [] 	

		x = 0
		while x < tags.length 
			tags2.push "<li><a href='http://127.0.0.1:2000/search?tag_search=" + tags[x] + " '>" + tags[x] + "</a>"
			x +=1
		end
		binding.pry
		tags3 = tags2.join(" ")

		html = File.read("./views/saved_searches.html")
		html = html.gsub("{{saved tags}}", tags3)
		client.puts html
	elsif request.path
		
	else 
		puts request.path
	end


	client.close
end




