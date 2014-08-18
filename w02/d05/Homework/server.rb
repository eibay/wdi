require 'socket'
require 'json'
require 'pry'
require 'httparty'
require 'uri'

# request = client.gets.chomp
# path = path.split(" ")[1]

# if path == "/"
# 	html = File.read('./views/index.html')
# 	puts html
# elsif path == "/stylesheets"
# 	css = File.read('./stylesheets/style.css')
# 	puts css
# elsif path =="/"



######### Part 1 artist ##########

# musicbrainz = TCPSocket.new 'musicbrainz.org', 80
# musicbrainz.puts "GET http://musicbrainz.org/ws/2/artist/?query=artist:abc&fmt=json
# "
# response = musicbrainz.gets
# musicbrainz.close

# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "HTTParty"})

# parsed = JSON.parse(response.to_s)

# binding.pry

# client.puts parsed

#################################

############ Part 1 #############

# musicbrainz = TCPSocket.new 'musicbrainz.org', 80
# musicbrainz.puts "GET http://musicbrainz.org/ws/2/artist/3ce737cb-f5bb-403d-a98a-e0602670229f?inc=aliases&fmt=json
# "
# response = musicbrainz.gets
# musicbrainz.close



# parsed = JSON.parse(response.to_s)

# binding.pry

# client.puts parsed

#################################

############ Part 2 #############

require 'socket'
require 'json'
require 'pry'
require 'httparty'
require 'uri'

server = TCPServer.new 2000

loop do

	client = server.accept
	client_ip = client.remote_address.ip_address
	
	puts "Client has connected from #{client_ip}"
	
	request = client.gets.chomp
	path = request.split(' ')[1]
	puts "#{Time.now} - Client #{client_ip} is attempting to reach #{path}"
	
	if path == "/"
		html = File.read('./views/index.html')
		client.puts html
	elsif path == "/stylesheets"	
		css = File.read('./stylesheets/style.css')
		client.puts css
	elsif path.split('?')[0] == "/artist"
		input = path.split("?")[1].split("=")[1]


	musicbrainz = TCPSocket.new 'musicbrainz.org', 80
	musicbrainz.puts "GET http://musicbrainz.org/ws/2/artist/?query=artist:#{URI.decode(input)}&fmt=json"
	response = musicbrainz.gets
	musicbrainz.close

	# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=#{URI.decode(input)}:abc&fmt=json", headers: {"User-Agent" => "HTTParty"})

	parsed = JSON.parse(response.to_s)

	artists = []

	artist_names = parsed["artist"]

	i = 0

	while i < artist_names.length
		artists <<  "<li><a href='http://musicbrainz.org/ws/2/artist/{{artist_id}}?inc=aliases&fmt=json'>#{artist_names[i]["name"]}</a></li>"
		i += 1
	end

	artists = artists.join(' ')

	# artists = artists.to_s

	html = File.read('./views/musics.html')
	html = html.gsub('{{artist_name}}', input)
	html = html.gsub('{{artist_names}}', artists)

		client.puts html
	# elsif path.split('?')[0] == "/artist/detail"

	# 	musicbrainz = TCPSocket.new 'musicbrainz.org', 80
	# 	musicbrainz.puts "GET http://musicbrainz.org/ws/2/artist/#{URI.decode(artist_id)}?inc=aliases&fmt=json"
	# 	response = musicbrainz.gets
	# 	musicbrainz.close

	else
	    html = File.read('./views/404.html')
	    client.puts(html)
	end
	  client.close
end

# I have only finished Part 1 & 2. I was struggling with using HTTParty but it has not worked yet.




