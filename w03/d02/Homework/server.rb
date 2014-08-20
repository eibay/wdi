require 'HTTParty'
require 'pry'
require 'socket'
require 'WEBrick'

server = TCPServer.new 2000
savedsearches = []
savedoutput = []
search = " "
loop do
	
client = server.accept
request = WEBrick::HTTPRequest.new(WEBrick::Config::HTTP)
request.parse(client)
puts request.path
#search page
if request.path == "/" && request.request_method == "GET"
	html = File.read('./views/index.html')
	html = html.gsub('{{searched}}', " ")
	client.puts(html)
#tag saved
elsif request.path == "/" && request.body == nil && request.request_method == "POST"
	
	if savedsearches.include?(search)
		html = File.read('./views/index.html')
		html = html.gsub('{{searched}}', "<p>you've already saved that tag</p>")
		client.puts(html)
	else
		savedsearches<<search
		html = File.read('./views/index.html')
		html = html.gsub('{{searched}}', " ")
		client.puts(html)
	end
#results page
elsif request.path == "/" && request.request_method == "POST" 
	search = request.body.split("=")[1]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
	html = File.read('./views/results.html')
	picArr = []
	response["data"].each do |x| picArr<<"<img src='#{x["images"]["standard_resolution"]["url"]}'>" end
	picArr = picArr.join('')
	html = html.gsub('{{pics}}', picArr).gsub('{{tag}}', search).gsub('{{savesearch}}', search)
	client.puts(html)
#saved tags page
elsif request.path == "/savedtags"
	html = File.read('./views/saved.html')
	savedtags = "<ul>"
	savedsearches.each do |x| savedtags += "<li><a href='/saved/#{x}'>#{x}</a></li>" end
	html = html.gsub('{{saved}}', savedtags)
	client.puts(html)
#saved tags results page
elsif request.path.split("/")[1] == "saved"
	search = request.path.split("/")[2]
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
	html = File.read('./views/results.html')
	picArr = []
	response["data"].each do |x| picArr<<"<img src='#{x["images"]["standard_resolution"]["url"]}'>" end
	picArr = picArr.join('')
	html = html.gsub('{{pics}}', picArr).gsub('{{tag}}', search).gsub('{{savesearch}}', search)
	client.puts(html)
#css
elsif request.path.include?("/styles/stylesheet.css")
	css = File.read('./styles/stylesheet.css')
	client.puts(css)


end
client.close
end