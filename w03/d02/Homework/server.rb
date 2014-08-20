
require 'webrick'
require 'httparty'
require 'socket'
require 'pry'

server = TCPServer.new 2000


loop do 

	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	binding.pry

	if request.path == "/" && request.request_method == "GET"
		html = File.read("./views/index.html")
		client.puts(html)
	elsif request.path == "/styles.css" && request.request_method == "GET"
		css = File.read('./stylesheets/styles.css')
		client.puts(css)

	elsif request.path == "/" && request.request_method == "POST"
		tag= request.body.split("=")[1]


	
	images=[]
	
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{specific_word}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")

	

	# elsif request.path == "/" && request.request_method == "POST"
	# 	puppy_name = request.body.split("=")[1]
	# 	puppies.push(puppy_name)
	# 	client.puts puppies.join(",")

	# elsif request.path == "/tag"

 	#response= response["data"]
	
	response["data"].each do |x|
		url = x["images"]["standard_resolution"]["url"]
		images.push("<li><img src='#{url}'></li>")
	end

	images = images.join(' ')

	html = File.read('.views/images.html')
	html = html.gsub('{{images}}', images)
	client.puts(html)
else
	html = File.read('./views/404.html')
	client.puts(html)
end


client.close

	
end