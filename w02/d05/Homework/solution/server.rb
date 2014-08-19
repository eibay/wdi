require 'pry'
require 'json' #to decode the adi
require 'socket' #to make phone calls with the server-need it for TCPServer, http party makes us not need it for socket
require 'httparty'#to get apis


server = TCPServer.new 2000 #opening up a server on our port

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
loop do #can be while true as well
	client = server.accept #waiting for client to accept our call
	request = client.gets #after the server picks up, this is the information we get, the first line
	url = request.split(" ")[1] #same as what we were doing for path - taking the url and splitting it
	params = parse_url(url) #doing the method on the new url we got and setting the variable to url

	if params[:path] == "/"
		firstpage = File.read("./views/index.html")
		firstpage = firstpage.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
		client.puts firstpage


	elsif params[:path] == "/name"
		names = []
	
	
# 	omdbapi = TCPSocket.new 'www.omdbapi.com', 80
 #    omdbapi.puts "GET /?s=#{word}"
 #    response = omdbapi.gets
 #    omdbapi.close
 #replacing this with httparty! cause it analyzes API and reads what we need
 
 	 artistnamesearch = params[:query_params][:searchword]

 	 #getting artist name from the searchword from html!!!
 	 #under query_word will be the search word after we split

 	
 	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artistnamesearch}&fmt=json", headers: {"User-Agent" => "HTTParty"})
 #this gets the api from musicbrainz
 	# afterjson = JSON.parse(response) dont need because already json
#converting to JSON

	response["artist"].each do|x|
		id = x["id"]
		name = x["name"]
		names << "<li> <a href='/name/#{id}'> #{name}</li>"
		ids[x["id"]] = x["name"]
		#creating hash of names and id
		
	end
	#taking each artist name and link putting it into empty array
	
	
	html = File.read("./views/index1.html")
	
	html = html.gsub("{{names}}", names.join('')) #give us a string-can put into another html file if u wanted to
	html = html.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
	client.puts html
	#to make a list of all the artists with that name
	
	elsif params[:path].split("/")[2]#getting second part of word
		specificartistid = params[:path].split("/")[2] 

		
	# name = URI.decode(params[:path].split("/")[2]) #taking out the %20 - another way to get the artist name if used artist name in the url

		 #getting id from hash of the artist
		name = ids["#{specificartistid}"]
		#getting artist name out using id
		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{specificartistid}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
		#httparty already doe json so no json.parse
		country = response["country"]
		type = response["type"]
		# picture = HTTParty.get("http://www.last.fm/music/#{specificartistid}") 
		# response = JSON.parse(picture)
		# first steps to getting picture
		#taking into account nil
		
		if country == nil && type != nil
			html1 = File.read("./views/index3.html")
			html1 = html1.gsub("{{country}}", "sorry no information is available")
			html1 = html1.gsub("{{type}}", type)
			html1 = html1.gsub("{{artist}}", name)
			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
			

		elsif type == nil && country != nil
			html1 = File.read("./views/index3.html")
			html1 = html1.gsub("{{country}}", country)
			html1 = html1.gsub("{{type}}", "sorry no information is available")
			html1 = html1.gsub("{{artist}}", name)
			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
			
			

		elsif country == nil && type == nil
			html1 = File.read("./views/index3.html")
			html1 = html1.gsub("{{country}}", "sorry no information is available")
			html1 = html1.gsub("{{type}}", "sorry no information is available")
			html1 = html1.gsub("{{artist}}",name)
			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
			
			
		else	
			html1 = File.read("./views/index3.html")
			html1 = html1.gsub("{{country}}", country)
			html1 = html1.gsub("{{type}}", type)
			html1 = html1.gsub("{{artist}}", name)
			html1 = html1.gsub("{{css}}", '<link rel ="stylesheet" type=text/css href="/style">')
			
		end
		client.puts html1

	elsif params[:path] == "/style"
		css = File.read('./stylesheets/style.css')
    	client.puts(css)

	else 
		client.puts "ERROR!"
	end
client.close
end








 #response = HTTParty.get("https://api.instagram.com/v1/media/popular?client_id=59f1ac61f0b547e4a6961cdf8b921cfe") after id is instragram key















