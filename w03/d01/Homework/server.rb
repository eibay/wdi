require 'httparty'
require 'pry'


server = TCPServer.new 2000


loop do
	client = server.accept
	request = client.gets
	url = request.split(' ')[1]


	if url == '/'
		html = File.read('./views/index.html')
		client.puts html

	elsif url == '/styles.css'
		css = File.read('./stylesheets/styles.css')
		client.puts css

	elsif url.include?('/search?') 
		tag = url.split('?')[1]
		tag = tag.split('=')[1]
		html = File.read('./views/search_page.html')

		images = []

		if tag.include?('+')
			
			tag = tag.split('+')
			tag = tag.join("")
		
			response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
			i = 0
			while i < response["data"].length
			images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
			i +=1
			end

		else
			
			response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
			i = 0
			while i < response["data"].length
			images.push("<img src='#{response["data"][i]["images"]["thumbnail"]["url"]}'>")
			i +=1
			end
		end
		
		html = html.gsub("{{tag}}", tag)
		html = html.gsub("{{images}}", images.join(""))


	#elsif request.path == '/' && request.request_method == 'POST'



	else 
		client.puts "error"

	end

client.close

end
