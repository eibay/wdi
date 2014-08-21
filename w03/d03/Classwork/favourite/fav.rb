require 'webrick'
require 'pry'
require 'httparty'

server = TCPServer.new 2000

ary_fav_things = []
images = []

# "
# POST /words HTTP/1.1
# Host: 127.0.0.1:2000
# Connection: keep-alive
# Content-Length: 19
# Cache-Control: max-age=0
# Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
# Origin: http://127.0.0.1:2000
# User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36
# Content-Type: application/x-www-form-urlencoded
# Referer: http://127.0.0.1:2000/
# Accept-Encoding: gzip,deflate,sdch
# Accept-Language: en-US,en;q=0.8


# specific_word=hello
# "

while true
	client = server.accept
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)

	if request.path == "/" && request.request_method == "GET"
		client.puts "<p> Start saving your favourite things! </p>"
		
		html = File.read("./views/index.html")
		html = html.gsub("{{FAVOURITE_THINGS}}", "")
		client.puts html

	elsif request.path == "/things" && request.request_method == "POST"
		p "request.body = #{request.body}" ####################################################################################
		saved_thing = request.body.split("=")[1]
		saved_thing = "<li> <a href='/photos?tag=#{saved_thing}'> #{saved_thing} </a></li>"

		if ary_fav_things.include?(saved_thing)
			client.puts "<p> you have '#{saved_thing}.split("<li>")[1]}' in the list already! <p>"
		else
			ary_fav_things << saved_thing
			client.puts "<p> you saved '#{saved_thing.split("<li>")[1]}'! <p>"
		end


		p ary_fav_things ####################################################################################
		html = File.read("./views/index.html")
		html = html.gsub("{{FAVOURITE_THINGS}}", "")
		client.puts html


	# elsif request.path == "/photos"
	# 	tag = request.query_string.split("=")[1]
	# 	ig = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?access_token=23131423.f59def8.a6672ba008ba4698bf9255c69b886261")
	# 	images << ig
	
	# 	images_html = ""
	# 	ig["data"].each do |x|
	# 		image_link = x["images"]["low_resolution"]["url"]
	# 		image = "<a href='/picture_big/#{x["images"]["standard_resolution"]}'><img src='#{image_link}'/></a> "
	# 		# # image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
	# 		image = image + "<form action='/save_image?#{image_link}' method='POST'><button>Save</button></form>"
	# 		images_html += image
	# 	end

	# 	html_images = File.read("./views/images.html")
	# 	html_images = html_images.gsub("{{TAG}}", tag)
	# 	html_images = html_images.gsub("{{IMAGES}}", images_html)

	# 	client.puts html_images


	elsif request.path == "/things" && request.request_method == "GET"
		p "request.query_string: #{request.query_string}" ####################################################################################
		p "request.query: #{request.query}" 

		client.puts "<p> These are your favourite things! <p>"
		html = File.read("./views/index.html")
		html = html.gsub("{{FAVOURITE_THINGS}}", ary_fav_things.join(" "))

		client.puts html
		if ary_fav_things.length == 0
			client.puts "<p> Nothing in here yet! Save some things! <p>"
		end
	end
	client.close
end