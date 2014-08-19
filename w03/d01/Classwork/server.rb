require 'pry'
require 'json'
require 'httparty'

# server = TCPServer.new 2000

# loop do

# client = server.accept

puts "Give me your tag"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
puts response["data"][0]["images"]["standard_resolution"]["url"]
# binding.pry
# parsed = JSON.parse(response)