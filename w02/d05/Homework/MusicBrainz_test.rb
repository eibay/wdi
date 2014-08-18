require 'pry'
require 'socket'
require 'httparty'

server = TCPServer.new 2000
# response = {
#      "artist" => [
#         [ 0] {
#                         "id" => "7473d5ab-14dd-4e4c-a249-7457629b22a8",
#                       "type" => "Person",
#                      "score" => "100",
#                       "name" => "Puppy",
#                  "sort-name" => "Puppy",
#                     "gender" => "male",
#                    "country" => "GB",
#                       "area" => {
#                        "id" => "8a754a16-0027-3a29-b6d7-2b40ea0481ed",
#                      "name" => "United Kingdom",
#                 "sort-name" => "United Kingdom"
#             },
#             "disambiguation" => "UK IDM producer Dave Hodgson",
#                  "life-span" => {
#                 "ended" => nil
#             }
#         },
#      ]
# }
while true

client = server.accept
puts "Client connected"

request = client.gets.chomp
url = request.split(" ")[1]
puts "Requesting #{url}"

if url == "/"
	client.puts "Type your search in the URL for now"

# I know it can't always be porkchop. 
elsif url.split("/")[1]
	search_word = url.split("/")[1]
	#search for "porkchop"
	response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{search_word}&fmt=json", headers: {"User-Agent" => "Httparty"})
	puts "Requesting search result from musicbrainz"

	#create html list of artist links from search result
	the_list = "<html><body>"
	the_list += "<ul>"

			response["artist"].each do |x|
				#this link is wrong because it's going to mb and not my display
				link = "http://musicbrainz.org/ws/2/artist/" + x["id"] + "?inc=aliases&fmt=json"
				template = "<li><a href={{link}}>{{artist}}</a></li>"
				template = template.gsub("{{link}}", link)
				template = template.gsub("{{artist}}", x["name"])

				the_list += template
			end
	the_list += "</ul>"
	the_list += "</body></html>"

	client.puts the_list


# elsif they've clicked on an individual artist from the_html
# extract artist id from the resulting url

#if i split it on the slash and [3] is "artist"
elsif url.split('/')[3] == "artist"
	url_id = url.split('/')[4].split('?')[0]
	#ask mb for individual artist information
	indiv_response = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{url_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "Httparty"})
	
client.puts "'artist'['name'], 'artist'['country'], 'artist'['disambiguation']"

#	client.puts indiv_response
# display "name", "country", "disambiguation"
# maybe read in artist_template.html here




else 
	client.puts "Hmmm"
end




client.close
end


4ad7cc36c172434588afd340aa74cd01
puts "Tag?"
tag = gets.chomp
response = HTTParty.get("https://api.instagram.com/v1/tags/search?q=#{tag}&client_id=4ad7cc36c172434588afd340aa74cd01")



