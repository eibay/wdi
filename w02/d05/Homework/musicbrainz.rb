require 'socket'
require 'httparty'
require 'json'
require 'pry'

# word = "Jewel"
server = TCPServer.new 2000


loop do

  client = server.accept

  request = client.gets

  url = request.split(" ")[1]

 

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=artist:jewel&fmt=json", headers: {"User-Agent" => "HTTParty"})

response["artist"][0]["name"]



client.close

end