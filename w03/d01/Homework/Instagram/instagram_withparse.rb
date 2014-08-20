require 'pry'
require 'httparty'
require 'socket'

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

while true

	client = server.accept
	puts "Client connected"

	request = client.gets.chomp
	url = request.split(" ")[1]
	puts "Requesting #{url}"

if url == "/"
	html = File.read('./views/query_form.html')
	client.puts html
	puts "Sent query_form to client"

	elsif url == "/stylesheets/instastyle.css"
		client.puts File.read('./stylesheets/instastyle.css')
		puts "Sent 'instastyle.css' to client" 

# http://127.0.0.1:2000/photos?tag_name=shoes
elsif url.split('?')[0] == "/photos"
	tag_name = url.split('=')[1]
	# get tag name from form 
	# and send request for info to instagram
	# name="tag_name" in my query form

	response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag_name}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")
	puts "Sent request to instagram"

		photo_array = []
		# looking for photo urls in the big hash
		response["data"].each do |pic|
		photo_url = pic["images"]["standard_resolution"]["url"]
		# push each photo into this array
		photo_array << "<img src='#{photo_url}'>"
		end

	html = File.read('./views/photo_page.html')
	html = html.gsub('{{tag_name}}', tag_name)
	# get the value (img) out of its index and all one string
	html = html.gsub('{{photos}}', photo_array.join(''))
	client.puts html
#binding.pry


else 
	client.puts "Something's wrong here."

end
	




# 4ad7cc36c172434588afd340aa74cd01
client.close
end