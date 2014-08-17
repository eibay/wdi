require 'socket'
require 'httparty'
require 'pry'
require 'erb'

def parse url
  arr = url.split '?'
  path = arr[0]
  query = arr[1]

  params = {}
  params[:path] = path

  if query.nil? 
  	params = {
  		path: path 
  	}
  else 
  	pairs = query.split '&'

  	key_values = []

  	pairs.each do |pair|
    	key_values.push(pair.split("="))
  	end

  	query_params = {}

  	key_values.each do |key_value|
    	query_params[key_value[0].to_sym] = key_value[1]
  	end

  	params = {
    	path: path,
    	query_params: query_params
  	}
  end 
  params
end


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

	unless request.nil?  # sometimes request will be nil 
		request = request.split ' '
		request = request[1]
		qu = parse request 

		if qu[:path] == '/'
			client.puts send_view("home")
		elsif qu[:path] == "/search"
			art_arr = looking_for qu[:query_params][:s] 
			$artists = art_arr.gather_up_artists
			client.puts send_view("search")
		elsif qu[:path] == "/artist"
			str = qu[:query_params][:id]
			$artist = str.get_artist
			client.puts send_view("artist")
		else 
			client.puts "<h1>404 Not Found</h1>" # fake 404 not found header 
		end 
	end 

	client.close 
end 
