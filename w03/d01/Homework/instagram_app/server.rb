require 'socket'
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
	request = client.gets
	url = request.split(" ")[1]
	puts "Client is attempting to reach #{url}."

	params = parse_url(url)
	images = []

	if params[:path] == "/"
		index = File.read("./views/index.html")
		client.puts(index)
		puts "Sent index"

	elsif params[:path] == "/style"
		css = File.read("./style/style.css")
		client.puts(css)
		puts "Sent css"

	elsif params[:path] == "/tag"
		tag = params[:query_params][:tag]
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

	else
		error = File.read("./views/404.html")
		client.puts(error)
		puts "Sent 404"
	end


client.close


end
