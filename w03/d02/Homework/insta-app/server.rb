require 'webrick'
require 'httparty'
require 'pry'
require 'uri'

server = TCPServer.new 2000

saved_searches = []
saved_photos = []

loop do

	client = server.accept
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client connected"

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client attempting to reach #{request.path}"
	request.parse(client)

	if request.path == "/"
		html = File.read("./views/main.html")
		client.puts(html)
	elsif request.path == "/photos"
# binding.pry
		tag = request.query["tag_search"]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

		image_str = ""
		response["data"].each do |i|
			image_html = File.read("./views/image_list.html")
			image_html = image_html.gsub("{{images}}", i["images"]["standard_resolution"]["url"].to_s)
			image_str += image_html
		end
# binding.pry
		image_page_html = File.read("./views/image_page.html")
		image_page_html = image_page_html.gsub("{{image_str}}", image_str)
		image_page_html = image_page_html.gsub("{{search_tag}}", tag)
		client.puts image_page_html
	
	elsif request.path == "/saved_tags"
		tag = request.body.split("=")[1]
		saved_searches.push(tag)

		saved_html = File.read("./views/saved.html")
		saved_html = saved_html.gsub("{{saved_data}}", saved_searches.to_s)
		client.puts saved_html

# binding.pry

	elsif request.path =="/saved_photos"
# binding.pry
	
	photo = URI.decode(request.body.split("=")[1])
	saved_photos.push(photo)

	saved_html = File.read("./views/saved_photos.html")
	saved_html = saved_html.gsub("{{saved_data}}", saved_photos.to_s)
	client.puts saved_html






	elsif request.path == "/style"
		css = File.read("./stylesheets/style.css")
		client.puts(css)
	elsif request.path == "/image_page_style"
		css = File.read("./stylesheets/image_page.css")
		client.puts(css)
	elsif request.path == "/save_page_style"
		css = File.read("./stylesheets/save_page_style.css")
		client.puts(css)
	else
		client.puts "<h1>404 Error</h1>"
	end

	client.close
end
















