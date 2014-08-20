require 'webrick'
require 'httparty'
require 'pry'

server = TCPServer.new 2000


saved_searches = []

loop do

client = server.accept
request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts request.request_line
	images = []
	

	if request.path == "/" && request.request_method == "GET"
		
		
		saved_search_lis = []
		saved_searches.each do |search_item|
		search_li = File.read("./views/search_lis.html").gsub("{{saved_search_item}}", search_item)
		saved_search_lis << search_li
		end
		index = File.read("./views/index.html")
		if saved_searches.length > 0
			index = index.gsub("{{saved_search_lis}}", saved_search_lis.join(''))
			
		else
			index = index.gsub("{{saved_search_lis}}", "<li>No saved searches</li>")
		end
# binding.pry
		client.puts(index)
		puts "Sent index"

	elsif request.path == "/style"
		css = File.read("./style/style.css")
		client.puts(css)
		puts "Sent css"

	elsif request.path == "/tag"
		tag = request.query_string.split("=")[1]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
		
		image_urls =[]
		response["data"].each do |result|
			image_urls << result["images"]["standard_resolution"]["url"]
		end
		
		images_html_formatted = []
		image_urls.each	do |images_url|
		img = File.read("./views/imgs.html")
		images_html_formatted << img.gsub("{{image source}}", images_url)
		end

		results_page = File.read("./views/results_page.html")
		results_page = results_page.gsub("{{tag}}", tag).gsub("{{images}}", images_html_formatted.join(""))
		client.puts(results_page)
		puts "Sent results page"

	elsif request.path == "/" && request.request_method == "POST"
		searched_tag = request.body.split("=")[1]
		saved_searches.push(searched_tag)

		saved_confirmation_page = File.read("./views/confirmation_page.html")
		client.puts(saved_confirmation_page.gsub("{{tag}}", searched_tag.capitalize))
		puts "Sent confirmation page"

	else
		error = File.read("./views/404.html")
		client.puts(error)
		puts "Sent 404"
	end


client.close


end
