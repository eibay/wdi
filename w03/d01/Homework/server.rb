require 'socket'
require 'HTTParty'
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
	puts "Client is connected"
	request = client.gets
	puts "request sent"
	url = request.split(" ")[1] #everything past the domain name	params = parse_url(url)


	if params[:path] == "/"
		firstpage = File.read("./views/index.html")
		firstpage = firstpage.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
		client.puts firstpage
		puts "first page sent"
		

	elsif params[:path] == "/tag"
		pictures = []
		tagword = params[:query_params][:tagwords]
		response = HTTParty.get("https://api.instagram.com/v1/tags/#{tagword}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
		puts "connected to instagram, got information and closed"

			response["data"].each do|x|
			image = x["images"]["standard_resolution"]["url"]
			pictures << "<a href='#{image}'><img src='#{image}'/></a>"
			#makes picture to another bigger to the link
			end

		tagword = tagword.upcase
		picturepage = File.read("./views/pictures.html")
		picturepage = picturepage.gsub("{{pictures", pictures.join(''))
		picturepage = picturepage.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
		picturepage = picturepage.gsub("{{word}}", tagword)
		client.puts picturepage
		puts "second page sent"
	elsif params[:path] = "/style"
		client.puts File.read("./stylesheets/style.css")
		puts "css sent"
	else
		client.puts "ERROR"

	end

client.close

end












