require 'httparty'
require 'json'
require 'socket'
require 'pry'

# joni%20mitchell
# response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "Httparty"})
# "artist"=>[{"id"=>"a6de8ef9-b1a1-4756-97aa-481bbb8a4069",
# response_1 = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:mitchell&fmt=json", headers: {"User-Agent" => "Httparty"})
# response_2 = HTTParty.get("http://musicbrainz.org/ws/2/artist/a6de8ef9-b1a1-4756-97aa-481bbb8a4069?inc=aliases&fmt=json", headers: {"User-Agent" => "Httparty"})

# The%20Naked%20And%20Famous

response_1 = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:The%20Naked%20And%20Famous&fmt=json", headers: {"User-Agent" => "Httparty"})

# http://musicbrainz.org/ws/2/artist/[***ARTIST_ID_FROM_MUSICBRAINZ***]?inc=aliases&fmt=json
puts response_1

print "_______________"
puts ""
# puts response_2

response_1["artist"].each do |artist|
  puts artist["name"]
end

response_1["artist"].each do |artist|
  if artist["name"] == "The Naked and Famous"
    puts artist["name"]
    puts "is from"
    puts artist["area"]["name"]
  end
end


# artists = []

# response_1["artist"].each do |artist|
#   artists.push(artist["name"])
# end

# puts artists


