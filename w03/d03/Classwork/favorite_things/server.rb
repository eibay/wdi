require 'pry'
require 'socket'
require 'webrick'

server = TCPServer.new 2001

favorite_things = []

loop do

client = server.accept
puts "#{Time.now} - Client has connected"

request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts "#{Time.now} - Client has requested #{request.path}"

if request.request_method == "GET"

	if request.path == "/"
		html = File.read("./views/index.html")
		client.puts html

	elsif request.path == "/stylesheets/style.css"
		css = File.read("./stylesheets/style.css")
	 	client.puts css
	 	puts "#{Time.now} - sent Client 'style.css'"

	 elsif request.path == "/favorite_things"
	 	list = []
	 	favorite_things.each do |str|
	 		list << File.read("./views/list_items/things_li.html").gsub("{{thing}}", str)
		end
		html = File.read("views/favorite_things.html").gsub("{{list}}", list.join("\n"))
		client.puts html

	else
 	end



elsif request.request_method == "POST"

	if request.path == "/favorite_things"
		favorite_things << request.query["thing"]
		list = []
		favorite_things.each do |str|
			list << File.read("./views/list_items/things_li.html").gsub("{{thing}}", str)
		end
		html = File.read("views/favorite_things.html").gsub("{{list}}", list.join("\n"))
		html = html.gsub("{{added}}", File.read("./views/line_added.html"))
		client.puts html
	end

end



client.close
# binding.pry

end