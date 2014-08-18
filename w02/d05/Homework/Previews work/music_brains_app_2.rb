
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

	elsif path.split("/")[1] == "artist" # /artist/Nirvana


		

		#######################
		### get artist name ###
		#######################
		if path.split("/")[2] == "name" ######### EXAMPLE ############  /artist/name/Sienna
			artist_name = path.split("=")[1]

			response_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_name}&fmt=json")
			# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:Sienna&fmt=json")

			ary_artist = response_artist["artist"] #gives array of artist hashes

# http://127.0.0.1:2000 /artist?keyword=Sienna
			##########################
			### displaying content ###
			##########################

			client.puts "<html> <ul>"
			
			ary_artist.each do |x|
	
				client.puts "<a href='/artist/id/#{x["id"]}'> <li> #{x["name"]} </li> </a>" #my intention is for a link to be generated here so when you click it it goes to the below elsif condition
			end

			client.puts "</ul> </html>"
			puts "sent data to client"
			




		elsif path.split("/")[2] == "id" #this will hardly ever be directly input. unlikely user will know the id. 
			#instead, this will be path when user clicks on link
			################### EXAMPLE ################# /artist/id/3143f7e4-c32d-4429-b8a5-837f0dbebd8d
			artist_id = path.split("=")[1]

			response_id = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{artist_id}?inc=aliases&fmt=json")


			client.puts response_id["name"].to_s
			client.puts response_id["country"].to_s



		end
	


	end
end