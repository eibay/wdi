word = "purrfect"

require 'json'
require 'httparty'

response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")
puts JSON.parse(response)

# Instead of:
# require 'socket'

# omdbapi = TCPSocket.new 'www.omdbapi.com', 80
# omdbapi.puts "GET /?s=#{word}"
# response = omdbapi.gets
# omdbapi.close

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:[***ARTIST_NAME***]&fmt=json")
puts JSON.parse(response)


response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:puppy&fmt=json")
puts JSON.parse(response)


response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:window&fmt=json")
puts JSON.parse(response)


puts response["artist"][0]["name"]


{"id"=>"e8888d36-20c5-47f5-aa6c-f9a08e307ad1", "score"=>"100", "name"=>"Porkchop", "sort-name"=>"Porkchop", "life-span"=>{"ended"=>nil}}
{"id"=>"ec70ca93-ef63-427e-b0a8-1da9422f0784", "type"=>"Group", "score"=>"62", "name"=>"Little Porkchop", "sort-name"=>"Little Porkchop", "life-span"=>{"ended"=>nil}}
{"id"=>"167e592f-f805-4688-abec-216eb8604ff2", "score"=>"50", "name"=>"Johnson-Nelson-Porkchop", "sort-name"=>"Johnson-Nelson-Porkchop", "life-span"=>{"ended"=>nil}}
{"id"=>"edf30ee5-4738-4495-82df-b68ead6766b4", "type"=>"Group", "score"=>"50", "name"=>"James Morton's Porkchop", "sort-name"=>"James Morton's Porkchop", "life-span"=>{"ended"=>nil}}
{"id"=>"c8e1d69d-ab3f-4aec-8b31-fc2f4280b581", "score"=>"50", "name"=>"Mark Porkchop Holder", "sort-name"=>"Mark Porkchop Holder", "life-span"=>{"ended"=>nil}}