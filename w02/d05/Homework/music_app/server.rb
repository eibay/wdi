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

# binding.pry
			
			response["artist"].each do |x|
				the_artist = File.read("./views/the_artist.html")
				the_artist = the_artist.gsub("{{name}}", x["name"])
				the_artist = the_artist.gsub("{{id}}", x["id"])
				artist_array.push(the_artist)
			end	

			html = html.gsub("{{artist_array}}", artist_array.join(''))
			client.puts(html)

			

		# elsif url.split("/").length > 4
		# 	artist_info = respone["artist"]
			
		# 	response["artist"].each do |y|
		# 		artist_info = File.read("./views/artist_info.html")
		# 		artist_info = artist_info.gsub("{{name}}", y["name"])
		# 		if y["country"] != nil
		# 		artist_info = artist_info.gsub("{{country}}", y["country"])
		# 		end
		# 		if y["disambiguation"] != nil
		# 		artist_info = artist_info.gsub("{{disambiguation}}", y["disambiguation"])
		# 		end
		# 		if y["life-span"]["begin"] != nil
		# 		artist_info = artist_info.gsub("{{life_begin}}", y["life-span"]["begin"])
		# 		end
		# 		if y["life-span"]["end"] != nil
		# 		artist_info = artist_info.gsub("{{life_end}}", y["life-span"]["end"])
		# 		end
				
		# 	end

		# 	client.puts(artist_info)



		end

end







