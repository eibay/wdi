require 'socket'
require 'json'
require 'httparty'
require 'pry'
require 'webrick'

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

server = TCPServer.new 2000
tags = []

loop do

	client = server.accept

	request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
	request.parse(client)
	
	if request.path == "/" && request.request_method == "GET"
		html = File.read('./views/index.html')
		client.puts html
	elsif request.path == "/style.css"
		css = File.read('./stylesheets/style.css')
		client.puts css
	elsif request.path == "/words" && request.request_method == "POST"
		tag = request.body.split('=')[1]
		images = []
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
		response = response["data"]
		i = 0
		while i < response.length
			url = response[i]['images']['standard_resolution']['url']
			images << "<li><a href='#{url}'><img src='#{url}'></a></li>"
			i += 1
		end
		images = images.join(' ')

		html = File.read('./views/images.html')
		html = html.gsub("{{tag}}", tag)
		html = html.gsub("{{images}}", images)
		client.puts html
	elsif request.path == "/tag" && request.request_method == "POST"
		tag = request.body.split('=')[0]
		
		tags.push("<li>#{tag}</li>")
		tags_string = tags.join(", ")

		html = File.read('./views/favorite.html')
		html = html.gsub("{{tags}}", tags_string)
		client.puts html
	else
		html = File.read('./views/404.html')
		client.puts html
	end
client.close
end














