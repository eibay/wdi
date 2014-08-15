require 'pry'
require 'socket'
require 'json'
require 'httparty'

server = TCPServer.new 2000

client = server.accept

request = client.gets
url = request.split(" ")[1]

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:#{artist_name}&fmt=json")
puts JSON.parse(response)