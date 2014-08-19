require 'HTTParty'
require 'pry'

puts "What tag would you like to see?"
tag = gets.chomp

# binding.pry

response = HTTParty.get"https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=3bbdd8399e754e5b8e24bd968905298f"

# puts response["data"][0]["images"]["standard_resolution"]["url"]
puts response["data"][1].keys
binding.pry
