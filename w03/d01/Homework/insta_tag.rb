require 'socket'
require 'httparty'
require 'pry'

server = TCPServer.new 2000

# "GET /recent?recent=bologna HTTP/1.1\r\n"

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
	puts "Client connected"

	request = client.gets
	"Client is requesting #{request}"

	path = request.split(' ')[1]
	params = parse_url(path)

	if params[:path] == '/'
		html = File.read("./views/index.html")
		client.puts html
		puts "Sent client index.html"
	elsif params[:path] == '/stylesheets/style.css'
		css = File.read('./stylesheets/style.css')
		client.puts css
		puts "Sent client style.css"
	elsif params[:path] == '/tag'
		insta = HTTParty.get("https://api.instagram.com/v1/tags/#{params[:query_params][:tag]}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
		images = []

		insta['data'].each {|img| images.push("<img src='#{img['images']['standard_resolution']['url']}'><br>")}

		html = File.read("./views/photos.html")
		html = html.gsub("{{images}}", images.join(''))
		client.puts html
		puts "Sent client photos.html"
	end

	client.close
	puts "Client disconnected"
end