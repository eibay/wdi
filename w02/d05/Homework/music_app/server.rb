require 'pry'
require 'json'
require 'httparty'

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
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client connected"
	request = client.gets
	url = request.split(" ")[1]
	puts "At #{Time.now.strftime("%I:%M:%S%P")} - Client is attempting to reach #{url}"
	params = parse_url(url)

		if params[:path] == "/"
			html = File.read ("./views/index.html")
			client.puts html
		elsif params[:path] == "/artists"
			search_artist = params[:query_params][:specific_artist]

# binding.pry
			
			response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{search_artist}&fmt=json", headers: {"User-Agent" => "HTTParty"})

			html = File.read("./views/artists.html")
			html = html.gsub("{{search_artist}}", search_artist)

			artist_array = []
			
			response["artist"].each do |x|
				the_artist = File.read("./views/the_artist.html")
				the_artist = the_artist.gsub("{{name}}", x["name"])
				the_artist = the_artist.gsub("{{id}}", x["id"])
				artist_array.push(the_artist)
			end	

			html = html.gsub("{{artist_array}}", artist_array.join(''))
			client.puts(html)

		elsif params[:path] == "/id"
			id = url.split("?")[1]			
			response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})
# binding.pry
				artist_info = File.read("./views/artist_info.html")
				artist_info = artist_info.gsub("{{name}}", response["name"].to_s)

				if response["country"].to_s != "" 
					artist_info = artist_info.gsub("{{country}}", response["country"].to_s)
				else 
					artist_info = artist_info.gsub("{{country}}", "N/A")
				end

				if response["disambiguation"].to_s != "" 
					artist_info = artist_info.gsub("{{disambiguation}}", response["disambiguation"].to_s)
				else 
					artist_info = artist_info.gsub("{{disambiguation}}", "N/A")
				end

				if response["life-span"].include?("begin") && response["life-span"]["begin"] != nil
					artist_info = artist_info.gsub("{{life_begin}}", response["life-span"]["begin"].to_s)
				else	
					artist_info = artist_info.gsub("{{life_begin}}", "N/A")
				end
# binding.pry
			client.puts(artist_info)

		end
		client.close

end







