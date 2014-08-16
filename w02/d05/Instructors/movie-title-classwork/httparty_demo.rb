word = "purrfect"

# Instead of:
# require 'socket'

# omdbapi = TCPSocket.new 'www.omdbapi.com', 80
# omdbapi.puts "GET /?s=#{word}"
# response = omdbapi.gets
# omdbapi.close

require 'json'
require 'httparty'

response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")
puts JSON.parse(response)

