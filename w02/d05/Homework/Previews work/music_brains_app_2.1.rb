
require 'pry'
require 'json'
require 'httparty'

server = TCPServer.new 2000

while true
	client = server.accept
	client_ip = client.remote_address.ip_address
	puts "#{Time.now} - client connected from #{client_ip}"

	request = client.gets
	path = request.split(" ")[1]
	puts "#{Time.now} - client is requesting #{path}"

	if path == "/" 

	client.puts File.read("./views/index.html")
  	# file:///artist/name?search=[word]

  	elsif path.split("/")[2] == "id"
		artist_id = path.split("/")[3]

		response_id = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})

		# client.puts response_id
		client.puts response_id["name"].to_s
		client.puts response_id["country"].to_s
		client.puts "sent artist_id to client"	

	elsif path.split("/")[1].split("?")[0] == "artist" # /artist/Nirvana
		artist_name = path.split("?")[1].split("=")[1]



		#######################
		### get artist name ###
		#######################


			response_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_name}&fmt=json", headers: {"User-Agent" => "HTTParty"})
			# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:Sienna&fmt=json")

			ary_artist = response_artist["artist"] #gives array of artist hashes


			##########################
			### displaying content ###
			##########################

			client.puts "<html> <ul>"
			
			ary_artist.each do |x|
	
				client.puts "<a href='/artist/id/#{x["id"]}'> <li> #{x["name"]} </li> </a>" #my intention is for a link to be generated here so when you click it it goes to the below elsif condition
			end

			client.puts "</ul> </html>"
			puts "sent artist_name to client"
			
			# client.puts response_artist


	# dunno if this works yet
	elsif path.split("/")[2] == "id" #this will hardly ever be directly input. unlikely user will know the id. 
		#instead, this will be path when user clicks on link
		################### EXAMPLE ################# /artist/id/3143f7e4-c32d-4429-b8a5-837f0dbebd8d
		
		client.puts "hello"
		artist_id = path.split("=")[1]

		response_id = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})


		client.puts "name: #{response_id["name"].to_s}"
		client.puts "country: #{response_id["country"].to_s}"
		puts "sent artist_id to client"


	else
		client.puts "404 File not found"
# http://127.0.0.1:2000/artist/id/85af0709-95db-4fbc-801a-120e9f4766d0
		
# 	a["artist"][0]["id"]


	end
	client.close
end