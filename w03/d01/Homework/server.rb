require 'pry'
require 'httparty'
require 'socket'

server = TCPServer.new 2000

loop do

	client = server.accept

	request = client.gets
	path = request.split(' ')[1]
	# params = parse_url (path)

	if path == "/"
		html = File.read('./views/index.html')
		client.puts(html)
	elsif path == "/styles.css"
		css = File.read('./stylesheets/styles.css')
		client.puts(css)
	elsif path.split("=")[0] == "/words?specific_word"
		specific_word= path.split("=")[1]

	
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{specific_word}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
	
	images=[]

	response["data"].each do |x|
		url = x["images"]["standard_resolution"]["url"] 
		images.push("<li><img src='#{url}'></li>")
	end

	


		images = images.join(' ')

		html = File.read('./views/images.html')
		html = html.gsub('{{images}}', images)
		client.puts(html)
	else
		html = File.read('./views/404.html')
		client.puts(html)
	end

	client.close

end