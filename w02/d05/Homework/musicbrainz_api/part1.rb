require 'httparty'

puts "Search results:"
query = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:Journey&fmt=json", headers: {"User-Agent" => "HTTParty"})
query["artist"].each do |artist|
	puts artist["name"]
end

journey_id = query["artist"][0]["id"]

journey_info = HTTParty.get("http://musicbrainz.org/ws/2/artist/#{journey_id}?inc=aliases&fmt=json", headers: {"User-Agent" => "HTTParty"})

country = journey_info["country"]
name = journey_info["name"]
info = journey_info["disambiguation"]

puts "\nBand information:"
puts "#{name} (#{country}): #{info}"