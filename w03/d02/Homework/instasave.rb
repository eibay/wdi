require 'webrick'
require 'httparty'
require 'pry'

server = TCPServer.new 2000
saved_tags = []
saved_image_gallery = []

while true

	



	client = server.accept
	p "client connected" ######################################################
	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	p "client's request is WEBricked" ######################################################
	request.parse(client)


	if request.path == "/"
		p "client is requesting #{request.path}" ######################################################
		client.puts File.read('./views/index.html')

	elsif request.path == "/photo"
		searched_tag = request.query["tag"]
		p "client searched for searched_tag: #{searched_tag}" #####################################################
		ig_stuff = HTTParty.get("https://api.instagram.com/v1/tags/#{searched_tag}/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
				# ig_stuff = HTTParty.get("https://api.instagram.com/v1/tags/hello/media/recent?client_id=b3dd0e6a077e45d0b8a026c954d59719")
												
		images_html = ""
		ig_stuff["data"].each do |x|
			image_link = x["images"]["low_resolution"]["url"]
			image = "<a href='/picture_big/#{x["images"]["standard_resolution"]}'><img src='#{image_link}'/></a> "
			# image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
			image = image + "<form action='/save_image?#{image_link}' method='POST'><button>Save</button></form>"
			images_html += image
		end

		html_images = File.read("./views/images.html")
		html_images = html_images.gsub("{{TAG}}", searched_tag)
		html_images = html_images.gsub("{{IMAGES}}", images_html)

		client.puts html_images
		p "sent /photo" #####################################################

	elsif request.path == "/save_image" 
		p "save_image request path = " + request.path
		image_link = request.path.split("?")[1]
		saved_image = "<img src='#{image_link}'/>"
		p saved_image
		saved_image_gallery << saved_image
		p saved_image_gallery

		html_saved_images = File.read("./views/saved_tags.html")
		html_saved_images = html_saved_images.gsub("{{SAVED_TAGS}}", saved_image_gallery.join(" "))
		client.puts html_saved_images

	elsif request.path == "/save" 
		searched_tag = "<a href='/photo?tag=#{searched_tag}'>#{searched_tag}</a>"
		# searched_tag = "<a href= 'request.body.split("=")[1]'>

		saved_tags << searched_tag 
		p "saved the searched_tag #{searched_tag} into saved_tags: #{saved_tags}" ####################################################
	

		# ######## Trying to make it link to same page ######
		# ig_stuff = HTTParty.get("https://api.instagram.com/v1/tags/#{searched_tag}/media/recent?access_token=23131423.f59def8.a6672ba008ba4698bf9255c69b886261")
		# images_html = ""
		# ig_stuff["data"].each do |x|
		# 	image = "<li><a href='/picture_big/#{x["images"]["standard_resolution"]}'><img src='#{x["images"]["low_resolution"]["url"]}'/></a></li> "
		# 	# image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
		# 	images_html += image
		# end

		# html_saved_tags = File.read("./views/images.html")
		# html_saved_tags = html_saved_tags.gsub("{{TAG}}", searched_tag)
		# html_saved_tags = html_saved_tags.gsub("{{IMAGES}}", images_html)
		# html_saved_tags = html_saved_tags.gsub("{{SAVED_TAGS}}", saved_tags.join(", "))
		# client.puts html_saved_tags
		# #######################################

		html_saved_tags = File.read("./views/saved_tags.html")
		html_saved_tags = html_saved_tags.gsub("{{SAVED_TAGS}}", saved_tags.join(", "))
		client.puts html_saved_tags
		p "sent /save" ####################################################
		# images_html = ""
		# ig_stuff["data"].each do |x|
		# 	image = "<li><a href='/picture_big/#{x["images"]["standard_resolution"]}'><img src='#{x["images"]["low_resolution"]["url"]}'/></a></li> "
		# 	# image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
		# 	images_html += image
		# end

		# html = File.read("./views/images.html")
		# html = html.gsub("{{TAG}}", searched_tag)
		# html = html.gsub("{{IMAGES}}", images_html)

		# client.puts html
		# puts saved_tags


	elsif request.path == "/style"
		client.puts File.read("./views/style_images.css")
		p "sent /style_images" #####################################################

	else 
		client.puts "404 Page not found. You're drunk, go home!"

	end

	client.close

end