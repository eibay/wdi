
require 'httparty'#to get apis

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "HTTParty"})

# this is it. all we needed to do to practice calling the API in ruby