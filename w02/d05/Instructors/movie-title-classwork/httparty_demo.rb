# word = "purrfect"
name = "cher"
# Instead of:
# require 'socket'

# omdbapi = TCPSocket.new 'www.omdbapi.com', 80
# omdbapi.puts "GET /?s=#{word}"
# response = omdbapi.gets
# omdbapi.close

require 'json'
require 'httparty'

# response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")

response = HTTParty.get("http://musicbrainz.org/ws/2/artist/?query=#{name}&fmt=json")


puts JSON.parse(response)

Pry(main)> require 'json'                                                   
true
[20] Pry(main)> JSON.parse(response)   