require 'HTTParty'
require 'pry'

request = Httparty.get("http://musicbrainz.org/ws/2/artist/?query=artist:elvis&fmt=json", headers: {"User-Agent" => "HTTParty"})

# binding.pry

# request = JSON.parse(request)
