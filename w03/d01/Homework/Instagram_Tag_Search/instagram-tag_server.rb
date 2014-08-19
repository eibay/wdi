require 'pry'
require 'httparty'
require 'socket'
# require 'json' #assuming we dont need this because httparty does it for us

server = TCPServer.new 2000 #opening up a server on our port

# what url can we use to test how this will work for today's task?
# hint = 'request' is a string that is typically going to have this formula:
# => "GET /words HTTP/1.1\r\n"

# url is the string typically the middle section of the 'request'.
# =>"/words"

# you get it like this:
# url = request.split(" ")[1]

# if you just look directly at a browser url, the url we refer to is the path that starts after /path 

# http://domain.com/path

		def parse_url(url) #taking the url and breaking it down to pieces to play with it
		  path = url.split("?")[0] 
		  query_string = url.split("?")[1]
		  params = {}
		  params[:path] = path

		  # why do we need this conditional here? how does it impact the equation above?
			if query_string == nil
		    	return params
		  	end

		pairs = query_string.split("&")
		key_values = []

			pairs.each do |pair|
			key_values.push(pair.split("="))
		  	end

		query_params = {}

		  	key_values.each do |key_value|
		    query_params[key_value[0].to_sym] = key_value[1]
		  	end

		params[:query_params] = query_params
		return params

		end


loop do 
	client = server.accept #waiting for client to accept our call

	request = client.gets #after the server picks up, this is the information we get, the first line

	url = request.split(" ")[1] #same as what we were doing for path - taking the url and splitting it
	
	params = parse_url(url) #doing the method on the new url we got and setting the variable to url

# classmate put the array = [] here. do i need to put it here vs. in the conditional?

# images = []

	if params[:path] == "/"
		rootpage = File.read('./views/index.html')
# do we need the css thing here vs. in the html doc? why?
		# rootpage = rootpage.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
		client.puts(rootpage)

# why do we read css in all these different places

	elsif params[:path] == "/styles.css"
	css = File.read('./stylesheets/styles.css')
	client.puts(css)


	elsif params[:path] == "/tags"
	    search_tag = params[:query_params][:specific_tag]
	   # this gives you the value in the inner hash query_params[:specific_tag] inside outer hash params[:query_params]

# i didn't have response = this + header, classmate did - why did I need it - esp when it worked fine in pry without having it? When was this mentioned in class?

	# headers: {"User-Agent" => "Httparty"})

	instagram_response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")

# with this headers thing added in, the updated response would be:
# instagram_response = HTTParty.get("https://api.instagram.com/v1/tags/#{search_tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2", headers: {"User-Agent" => "HTTParty"})

	# 'instagram_response' is going to be the structure that instagram returns with an answer to our query

	# binding.pry
	# THIS IS A GREAT PLACE TO PUT A BINDING.PRY TO LOOK AT THE STRUCTURE OF THE API RESPONSE!

# classmate had the html file read stuff before the HTTParty. Is this the right way or is that the right way? Why?

	    html = File.read('./views/tag_results.html')
	    html = html.gsub('{{search_tag}}', search_tag)

# I initialize the array to hold all the images here - should i do it before the conditional instead?

images = []

		instagram_response["data"].each do |tag_instance|
			tag_record = File.read('./views/individual_tag.html')
			tag_record = tag_record.gsub('{{username}}', tag_instance["user"]["username"])
			tag_record = tag_record.gsub('{{pic_url}}', tag_instance["images"]["standard_resolution"]["url"])
			tag_record = tag_record.gsub('{{width}}', tag_instance["images"]["standard_resolution"]["width"].to_s)

# gsub is a string method - so we have to convert the integers width and height to strings!

# note - need to put .to_s OUTSIDE the index brackets, because its not a value inside of the brackets - thats still part of the key

# OLD:
# 	tag_record = tag_record.gsub('{{width}}', tag_instance["images"]["standard_resolution"]["width"])

			tag_record = tag_record.gsub('{{height}}', tag_instance["images"]["standard_resolution"]["height"].to_s)
			tag_record = tag_record.gsub('{{filter}}', tag_instance["filter"])
		 	images.push(tag_record)
		end

		html = html.gsub('{{all_instagram_images}}', images.join(''))

		# why do we need to put this here? doesn't it just use our css from the earlier conditional by the root page?
		# if i keep it here, do i need to update the stylesheet path?

		html = html.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')

		client.puts(html)

	else client.puts "Error"
		 puts "Error"

	end

client.close

end








