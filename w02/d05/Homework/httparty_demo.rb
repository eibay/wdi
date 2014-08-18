# word = "purrfect"

# Instead of:
# require 'socket'

# omdbapi = TCPSocket.new 'www.omdbapi.com', 80
# omdbapi.puts "GET /?s=#{word}"
# response = omdbapi.gets
# omdbapi.close

require 'json'
require 'httparty'


artists_response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:prince&fmt=json")

artists = []
artists_response["artist"].each do |result|
	artists << result["name"]
end
print artists


single_artist = HTTParty.get("http://musicbrainz.org/ws/2/artist/070d193a-845c-479f-980e-bef15710653e?inc=aliases&fmt=json")
print single_artist
