require 'pry'
require 'json'
require 'httparty'

server = TCPServer.new 2000

###########################
### Definitions         ###
###########################

def parse_url(url)
  path = url.split("?")[0] 			# artist  ---  /artist?specific_word=owl&other_word=octopus
  query_string = url.split("?")[1] 	# specific_word=owl  ---  /artist?specific_word=owl

  params = {}
  params[:path] = path				# params = {path: artist}

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


###########################
### Start Code          ###
###########################


while true
	client = server.accept
	puts "client connected"
	request = client.gets
	url = request.split(" ")[1] # GET /path/subpath
	puts "client is attempting to reach #{url}"
	params = parse_url(url)


	if params[:path] == "/"
		client.puts File.read("./views/index.html")

	elsif params[:path] == "/artist"

		searched_artist = params[:query_params][:artist_name]

		response_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{searched_artist}&fmt=json", headers: {"User-Agent" => "HTTParty"})
# response_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:Nightwish&fmt=json", headers: {"User-Agent" => "HTTParty"})
		ary_artist = response_artist["artist"]

		client.puts "<html> <ul>"
			
		# results_artist = []

		link_string = ""
		
		ary_artist.each do |x|
			client.puts "<a href='/id?#{x["id"]}'> <li> #{x["name"]} </li> </a>" #my intention is for a link to be generated here so when you click it it goes to the below elsif condition
		end

		client.puts "</ul> </html>"
		
		puts "sent artist_name to client"
		# client.puts response_artist
	elsif url == "/css"
		client.puts File.read("./views/main.css")


	elsif params[:path] == "/id"
		# client.puts "hello"
		p url # use this to see if url is what i think it is. espeically if its to do with splits among splits
		searched_id = url.split('?')[1]
		p searched_id # just to check what it exactly is


		response_id = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{searched_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
# HTTParty.get("http://musicbrainz.org/ws/2/artist/b10bbbfc-cf9e-42e0-be17-e2c3e1d2600d?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
		# puts response_id
		# client.puts response_id

		html = File.read("./views/artist_id.html")
		html = html.gsub("{{ARTIST_NAME}}", response_id["name"].to_s)
		html = html.gsub("{{COUNTRY}}", response_id["country"].to_s)
		html = html.gsub("{{SCORE}}", response_id["score"].to_s)
		html = html.gsub("{{TYPE}}", response_id["type"].to_s)
		html = html.gsub("{{LINK}}", "http://musicbrainz.org/artist/#{searched_id}")

		client.puts html
		puts "sent artist ID details to client"





	elsif url == "/404monkey.jpg"
		client.puts File.read "./views/404monkey.jpg"
	else
		client.puts File.read("./views/error.html")
		
	end
	client.close
end







