require 'pry'
require 'json' #to decode the adi
require 'socket' #to make phone calls with the server-need it for TCPServer, http party makes us not need it for socket
require 'httparty'#to get apis


server = TCPServer.new 2000 

def parse_url(url) #taking the url and breaking it down to pieces to play with it
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
#this is what params gives us!!! broke the url into this
# {
#             :path => "/the_forest",
#     :query_params => {
#         :animal => "monkeys",
#           :food => "bananas"
#     
# }
end
ids = {}
loop do 
	client = server.accept 
	request = client.gets 

	puts "Client connected"

	url = request.split(" ")[1] 
	params = parse_url(url) 
 	
 	puts "Requesting #{url}"

	if params[:path] == "/"
		index_html = File.read("./views/index.html")
		index_html = index_html.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/stylesheets/styles.css">')
		client.puts index_html

	elsif params[:path] == "/stylesheets/styles.css"
		css = File.read('./stylesheets/styles.css')
    	client.puts(css)


	# elsif params[:path] == "/styles.css"
	#     css = File.read("./stylesheets/styles.css")

	elsif params[:path] == "/concert.jpg"
		background = File.read('./concert.jpg')
	client.puts(background)

	elsif params[:path] == "/artist"
		names = []
	
 	 artist_name = params[:query_params][:name_search]
 	
 	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_name}&fmt=json", headers: {"User-Agent" => "HTTParty"})

		response["artist"].each do|x|
			id = x["id"]
			name = x["name"]
			names << "<li><a href='/artist/#{id}'>#{name}</li>"
			ids[x["id"]] = x["name"]
			
		end
	
	html = File.read("./views/search_results.html")
	
	html = html.gsub("{{names}}", names.join(''))
	html = html.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/stylesheets/styles.css">')

	client.puts html
	
	elsif params[:path].split("/")[2]
		artist_id = params[:path].split("/")[2] 
		name = ids["#{artist_id}"]
		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
		country = response["country"]
		type = response["type"]
		
		profile_html = File.read("./views/profile.html")
		profile_html = profile_html.gsub("{{artist_id}}", name)
		profile_html = profile_html.gsub("{{country}}", country)
		profile_html = profile_html.gsub("{{type}}", type)

		client.puts profile_html

	else 
		   html = File.read('./views/404.html')
    client.puts(html)
	end
client.close
end