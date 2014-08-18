require 'httparty'
require 'pry'


request = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_result}&fmt=json", headers: {"User-Agent" => "HTTParty"})

request = JSON.parse(request)