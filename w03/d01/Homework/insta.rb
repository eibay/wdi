require 'HTTParty'
require 'pry'
require 'JSON'
require 'socket'

server = TCPServer.new 2000

loop do 

client = server.accept
request = client.gets
path = request.split(" ")[1]

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
params = parse_url(path)
puts path
if path == "/"
	html = File.read('./views/index.html')

	client.puts(html)
elsif params[:path] == "/insta"
	search = []
	search = params[:query_params][:pic].split("+")
		search = search.join('')
	
	response = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=8fe4db31e3a940068664c1e7e3c5c061")
	html = File.read('./views/results.html')
	picArr = []
	response["data"].each do |x| picArr<<"<img src='#{x["images"]["standard_resolution"]["url"]}'>" end
	picArr = picArr.join('')
	html = html.gsub('{{pics}}', picArr).gsub('{{tag}}', params[:query_params][:pic])
	client.puts(html)
elsif params[:path] == "/styles/stylesheet.css"
	css = File.read('./styles/stylesheet.css')
	client.puts(css)




end
client.close
end
















