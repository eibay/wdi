require 'pry'
require 'webrick'

server =TCPServer.new 2000

favorite_things_array = []

loop do 

client = server.accept
request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts request.request_line
favorite_things_page = File.read("./views/favorite_things.html")
favorite_things_lis =[]

if request.path == "/"
	index = File.read("./views/index.html")
	client.puts(index)
	puts "Sent index"

elsif request.path == "/favorite_things" && request.request_method == "POST"
	fave_thing = request.body.split("=")[1]
	favorite_things_array.push(fave_thing)
	favorite_things_lis_html = File.read("./views/favorite_thing_lis.html")
	favorite_things_array.each do |fav|
		favorite_things_lis << favorite_things_lis_html.gsub("{{favorite thing}}", fav)
		end
	client.puts favorite_things_page.gsub("{{favorite_things_lis}}", favorite_things_lis.join(''))
	puts "Sent favorite things page with posted item"	

elsif request.path == "/favorite_things" && request.request_method == "GET"	
		if favorite_things_array.length > 0
		# favorite_things_lis_html = File.read("./views/favorite_thing_lis.html")
		# favorite_things_array.each do |fav|
		# favorite_things_lis << favorite_things_lis_html.gsub("{{favorite thing}}", fav)
		# end
		client.puts favorite_things_page.gsub("{{favorite_things_lis}}", favorite_things_lis.join(''))
		puts "Sent favorite things GET page"	
		else
		no_favorite_things_li = File.read("./views/no_favorite_things.html")
		client.puts favorite_things_page.gsub("{{favorite_things_lis}}", no_favorite_things_li)
		puts "Sent empty favorite things GET page"
		end
end























client.close	
end