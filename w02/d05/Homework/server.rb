require 'socket'
require 'httparty'
require 'pry'
require 'erb'

def looking_for artist 
	# returns an array of Hashes 
	str = "http://musicbrainz.org/ws/2/artist/?query=artist:#{artist}&fmt=json"
	res = HTTParty.get(str, headers: {"User-Agent" => "Httparty"}) 
	res["artist"]
end 

class String 
	def get_artist
		# returns an artist Hash  
		str = "http://musicbrainz.org/ws/2/artist/#{self}?inc=aliases&fmt=json"
		HTTParty.get(str, headers: {"User-Agent" => "Httparty"}) 
	end 
end 

class Array 
	def gather_up_artists 
		self.map do |result|
			result["id"].get_artist
		end 
	end 
end 

def send_view which   
	f = File.read "./views/#{which}/index.html.erb" 
	e = ERB.new f 
	v = e.result binding 
end 

s = TCPServer.new 2000

loop do 
	client = s.accept 
	request = client.gets

	if request.nil? # still getting nil requests 
		# do nothing  
	else 
		request.chomp! 
		arr = request.split ' '
		r = arr[1]

		if r == '/'
			client.puts send_view("home")
		elsif r[0,7] == "/search"
			arr = r.split '?'
			str = arr[1]
			arr = str.split '='
			huh = arr[1]
			art_arr = looking_for(huh)
			puts art_arr
			$artists = art_arr.gather_up_artists
			client.puts send_view("search")
		elsif r[0,7] == "/artist"
			arr = r.split '?'
			str = arr[1]
			$artist = str.get_artist
			client.puts send_view("artist")
		else 
			client.puts "<h1>404 Not Found</h1>" # fake 404 not found header 
		end 
	end 

	client.close 
end 
