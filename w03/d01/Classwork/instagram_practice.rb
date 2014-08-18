require 'httparty'

server = TCPServer.new 2000

loop do

client = server.accept

client.puts "Give me your tag"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/snow/media/recent?#{tag}")

parsed = JSON.parse(response)

puts parsed

client.close

end

## Grab the most recent photo with this tag
## 
