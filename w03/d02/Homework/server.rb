require 'socket'
require 'pry'
require 'webrick'
require 'httparty'

server = TCPServer.new 2000

searches = []

loop do 

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

		if request.path == "/" && request.request_method == "GET"
			index_html = File.read('./views/index.html')
			client.puts(index_html)

		elsif request.path == "/stylesheets/styles.css"
			client.puts File.read('./stylesheets/styles.css')

		elsif request.path == "/images/polaroid.jpg"
			client.puts File.read('./images/polaroid.jpg')

		elsif request.path == "/tag" && request.request_method == "GET"
			tag = request.query["search"]
			images = []

			# tag = request.query["search"].capitalize

			instagram_api = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")
			
			instagram_api["data"].each do |x|
			img_url = x["images"]["standard_resolution"]["url"]
			images << "<a href='#{img_url}'><img src='#{img_url}'></a>"
				end

			results_html = File.read('./views/results.html')
			results_html = results_html.gsub('{{url}}', images.join(''))
			results_html = results_html.gsub('{{tags}}', tag)
			results_html = results_html.gsub("{{tags}}", tag || "Not found")
			client.puts(results_html)
	
		elsif request.path == "/saved" && request.request_method == "POST"
		
				saved = request.body.split("=")[1]
				unless searches.include?request.body.split("=")[1]
					searches << "<li><a href='/tag?search=#{saved}'>#{saved}</a></li>"
				end
#Create another page of saved searches using GET so user can navigate there directly without having to search again to access list
			searches_html = File.read('./views/searches.html')
			searches_html = searches_html.gsub('{{value}}', searches.join(''))
			client.puts searches_html

		else 
			error_html = File.read('./views/404.html')
			client.puts(error_html)

		end

	client.close
end