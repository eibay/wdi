
require 'pry'
require 'json'
require 'socket'
require 'httparty'

server = TCPServer.new 2000

loop do 
	client = server.accept
	request = client.gets
	url = request.split(" ")[1]

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
	
	if url == "/"
		html = File.read('./views/index.html')
	    client.puts html
	    puts "Client has connected to Music Database"


	elsif url.split("?")[0] == "/words"
		search_results = parse_url(url)
		puts search_results
		word = search_results[:query_params][:artist_search]
		response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{word}&fmt=json", headers: {"User-Agent" => "Httparty"})

		
		id=[]
		response["artist"].each do |a|
			id.push "<li><a href=/music/" + a["id"]+ ">" + a["name"] + "</a></li>"
		end

		id2 = id.join('').to_s
 		html = File.read('./views/search_results.html')
	    html = html.gsub('{{search_results}}', id2)
	    html = html.gsub('{{search}}', word)
	    client.puts html
	    puts "Client has searched for #{word}"


	elsif url.split("?")[0].split("/")[1] == "music"
	 	
	 	id = url.split("?")[0].split("/")[2]
	 	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{id}?inc=aliases&fmt=json", headers: {"User-Agent" => "Httparty"})
		
		artist_info = "You searched for #{response["name"]}. From #{response["country"]} <br> Come back later when I find an API with more information to share."
	 	artist = response["name"]
	 	# pictures = HTTParty.get("http://musicbrainz.org/release/#{id}", headers: {"User-Agent" => "Httparty"})
	 	puts response


	 	html = File.read('./views/specific_artist.html')
	    html = html.gsub('{{search_results}}', artist_info)
	    # html = html.gsub('{{picture}}', pictures)
	    html = html.gsub('{{search}}', artist)
	    client.puts html
	    puts "Client has accessed #{response["name"]}"


	elsif url.split("?")[0] == "../stylesheet/styles.css"
		css = File.read('./stylesheet/styles.css')
		client.puts css
	else
		html = File.read('./views/404.html')
		client.puts html
		puts "Client has requested a bad path"
	end 
client.close
end
