require "HTTParty"
require "socket"
require "pry"

server = TCPServer.new 2000

loop do 
	client = server.accept
	request = client.gets
	url = request.split(" ")[1]
	

	def parse_url(url)
	  path = url.split("?")[0]
	  query_string = url.split("?")[1]

	  params = {}
	  params[:path] = path

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

	if url == "/"
		html = File.read("./views/index.html")
		client.puts html
	
	elsif url.split("?")[0] == "/images"
		tag = parse_url(url)[:query_params][:tag_search]
		tag_request = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d")
		
		images=[]
		tag_request["data"].each do |a|
			images.push a["images"]
		end

		formatted_images = []
		
		x=0
		while x < images.length
			formatted_images.push "<img src='" + images[x]["low_resolution"]["url"] + "' alt=''>"
			x +=1
		end
		
		formatted_images_join = formatted_images.join(" ")
		html = File.read("./views/search_results.html")
		html = html.gsub('{{images}}', formatted_images_join)
		client.puts html


	elsif url == "/stylesheets/styles.css"
		css = File.read("./stylesheets/styles.css")
		client.puts css

	else
		puts url

	end
client.close





end