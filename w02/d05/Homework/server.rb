require 'socket'
require 'httparty'
require 'pry'
require 'erb'

class String 
	def in_red 
		"\033[1;31m" + self + "\033[0m"
	end 

	def in_green 
		"\033[1;32m" + self + "\033[0m"
	end 

	def in_blue 
		"\033[0;34m" + self + "\033[0m"
	end 
end 

def looking_for artist 
	# returns an array of Hashes 
	str = "http://musicbrainz.org/ws/2/artist/?query=artist:#{artist}&fmt=json"
	res = HTTParty.get str 
	res["artist"]
end 

=begin 
ARTIST HASHES LOOK LIKE THIS! 
{
                        "id" => "e7795772-331e-4dd0-929a-89c78967b1eb",
                      "type" => "Person",
                     "score" => "100",
                      "name" => "Sarah",
                 "sort-name" => "Sarah",
                   "country" => "FR",
                      "area" => {
                       "id" => "08310658-51eb-3801-80de-5a0739207115",
                     "name" => "France",
                "sort-name" => "France"
            },
            "disambiguation" => "French techno vocalist \"Lovin' You\"",
                 "life-span" => {
                "ended" => nil
            }
        }

{"country"=>"US", 
"ipis"=>[], 
"area"=>{"disambiguation"=>"", 
	"iso_3166_3_codes"=>[], 
	"sort-name"=>"United States", 
	"name"=>"United States", 
	"id"=>"489ce91b-6658-3307-9877-795b68554c98",
	"iso_3166_2_codes"=>[], 
	"iso_3166_1_codes"=>["US"]},
"sort-name"=>"Nirvana", 
"name"=>"Nirvana", 
"disambiguation"=>"90s US grunge band", 
"life-span"=>{"ended"=>true, 
"begin"=>"1988-01", 
"end"=>"1994-04-05"}, 
"end_area"=>nil, 
"aliases"=>[{"primary"=>nil, 
"sort-name"=>"Nirvana US", 
"name"=>"Nirvana US", 
"type"=>nil, "locale"=>nil}], 
"id"=>"5b11f4ce-a62d-471e-81fc-a69a8278c7da", 
"type"=>"Group", 
"begin_area"=>{"disambiguation"=>"", 
"iso_3166_3_codes"=>[], 
"sort-name"=>"Aberdeen", 
"name"=>"Aberdeen", 
"id"=>"a640b45c-c173-49b1-8030-973603e895b5", 
"iso_3166_2_codes"=>[], 
"iso_3166_1_codes"=>[]}}

=end 

class String 
	def get_artist
		# returns an artist Hash  
		str = "http://musicbrainz.org/ws/2/artist/#{self}?inc=aliases&fmt=json"
		HTTParty.get str 
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

=begin 
artists = looking_for("love").gather_up_artists 

# print 
# origin country,  
# artist/band name, 
# general info about the artist.
artists.each do |artist|
	country = artist["country"]
	puts country.in_red unless country.nil? 
	name = artist["name"]
	puts name.in_green unless name.nil? 
	info = artist["disambiguation"]
	puts info.in_blue unless info.nil? 
end 
=end 

s = TCPServer.new 2000

loop do 
	client = s.accept 
	request = client.gets 
	arr = request.split ' '
	r = arr[1]
	puts r 
	if r == '/'
		client.puts send_view("home")
	elsif r[0,7] == "/search"
		puts "A search was made."
		client.puts "<h1>You made a search.</h1>"
	end 

	client.close 
end 
