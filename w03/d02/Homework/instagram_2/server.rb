require 'socket'
require 'json'
require 'pry'
require 'HTTParty'
 
server = TCPServer.new 2000

def parse_url(url)
	path = url.split("?")[0]
	query_string = url.split("?")[1]

	# puts path, query_string

	params = {}
	params[:path] = path

	if query_string == nil
		return params
	end

	key_values = []

end

loop do

  client = server.accept
  request = client.gets.chomp
  path = request.split(' ')[1]
  params = parse_url(path)

  if params[:path] == "/"
  	html = File.read('./views/index.html')
  	client.puts(html)
  elsif params[:path] == "/"
  	tag = params[:tag]
  	html.gsub!("{{tag}}", info["search for photos"])
  	api_url = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=17a4630338cd4da38b94cbbecd787fae" 
  	recent_photos = HTTParty.get(api_url, headers: {"User-Agent" => "HTTParty"}) 
  	binding.pry
  	html = "<html><body><ol>"
  	tags.each do |tag|
  		html = File.read('./views/searches.html')
  		html.gsub!("{{tag}}", info["search for photos"])
  		html += tag_li
  		html += "</ol></body></html>"
  	end 
  	client.puts(html)
  else
  	html = File.read('./views/404.html')
  	client.puts(html)
  	client.puts("Params: #{params.inspect}")
  end

  client.close

end