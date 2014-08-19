require 'httparty'
require 'pry'

server = TCPServer.new 2000

def parse_url(url)
	path = url.split("?")[0]
	query_string = url.split("?")[1]

	params = {}
	params[:path] = path

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

	client = server.accept
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client connected"

	request = client.gets
	path = request.split(" ")[1]
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client attempting to reach r#{path}"
	params = parse_url(path)

	if params[:path] == "/"
		html = File.read("./views/main.html")
		client.puts(html)
	elsif params[:path] == "/photos"
		tag = params[:query_params][:tag_choice]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

		image_str = ""
		response["data"].each do |i|
			image_html = File.read("./views/tag_page.html")
			image_html = image_html.gsub("{{images}}", i["images"]["standard_resolution"]["url"])
			image_str += image_html
		end


		image_page = File.read("./views/image_page.html")
		image_page = image_page.gsub("{{search_tag}}", tag)
		image_page = image_page.gsub("{{image_str}}", image_str)
		client.puts image_page

	elsif path == "/style.css"
		css = File.read("./stylesheets/style.css")
		client.puts(css)
	elsif path == "/tag_page.css"
		css = File.read("./stylesheets/image_page.css")
		client.puts(css)
	else
		client.puts "404 Error"
	end
	client.close
end














