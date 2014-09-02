require 'httparty'
require 'pry'


request = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "HTTParty"})

binding.pry
request = JSON.parse(request)

