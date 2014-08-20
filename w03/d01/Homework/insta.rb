require 'httparty'
require 'pry'

server = TCPServer.new 2000

while true


	def parse_url(url)
	  path = url.split("?")[0] 			# artist  ---  /artist?specific_word=owl&other_word=octopus
	  query_string = url.split("?")[1] 	# specific_word=owl  ---  /artist?specific_word=owl

	  params = {}
	  params[:path] = path				# params = {path: artist}

	  if query_string == nil			
	    return params
	  end

	  pairs = query_string.split("&")	# ["specific_word=owl"]

	  key_values = []			

	  pairs.each do |pair|
	    key_values.push(pair.split("="))	# [["specific_word", "owl"]]
	  end

	  query_params = {}

	  key_values.each do |key_value|
	    query_params[key_value[0].to_sym] = key_value[1] 	# {:specific_word => "owl"}
	  end

	  params[:query_params] = query_params 	# { :path => "/artist", 
	  										#   :query_params => {:specific_word => "owl"} }

	# url = www.domain.com/path/?param_name=param_value&param_name2=param_value2
	# GET 	/path/	HTTP1.1 		-- 2nd type of path
	# request = 
	  return params
	end

	client = server.accept
p "client connected"
	request = client.gets
p "client is requesting request: #{request}"
	url = request.split(" ")[1]
p "client is attempting to reach url: #{url}"
	params = parse_url(url)


	if params[:path] == "/"
		client.puts File.read("./views/index.html")

	elsif params[:path] == "/photo"
		searched_tag = params[:query_params][:tag]
p "client searched for searched_tag: #{searched_tag}"
		ig_stuff = HTTParty.get("https://api.instagram.com/v1/tags/#{searched_tag}/media/recent?access_token=23131423.f59def8.a6672ba008ba4698bf9255c69b886261")
		# ig_stuff = HTTParty.get("https://api.instagram.com/v1/tags/monkey/media/recent?access_token=23131423.f59def8.a6672ba008ba4698bf9255c69b886261")
		# ig_stuff["data"][1]["images"]["low_resolution"]["url"]  ----- for the image link
# p "client searched for ig_stuff['data']: #{ig_stuff["data"]}"
		images_html = ""
		ig_stuff["data"].each do |x|
			image = "<li><a href='/picture_big/#{x["images"]["standard_resolution"]}'><img src='#{x["images"]["low_resolution"]["url"]}'/></a></li> "
			# image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
			images_html += image
		end

		# images_str = ""
		# ig_stuff["data"].each do |x|
		# 	image_html = 
		# 	image_html = "<img src='#{x["images"]["low_resolution"]["url"]}'/> "
		# 	# image = "<li><img src='#{x["images"]["low_resolution"]["url"]}'/></li> "
		# 	images_str += image
		# end

		html = File.read("./views/images.html")
		html = html.gsub("{{TAG}}", searched_tag)
		html = html.gsub("{{IMAGES}}", images_html)

		client.puts html

		##### WHY CANT I LINK TO A ZOOMED IN PHOTO??" ####
# 	elsif url.split("/")[1] == "picture_big"
# 		image_link = url.split('=>"')[1].split('",')[0]
# p "client searching for image_link: #{image_link}"
# 		client.puts "<img src='#{image_link}'/>"

# picture_big/%7B"url"=>"http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10611277_522983774514379_248085524_n.jpg",%20"width"=>640,%20"height"=>640%7D
# http://scontent-a.cdninstagram.com/hphotos-xaf1/t51.2885-15/10611277_522983774514379_248085524_n.jpg
	
	elsif url == "/style"
		client.puts File.read("./views/style_images.css")
p "sent /style_images"

	else 
		client.puts "404 Page not found. You're drunk, go home!"

	end


	client.close


end
