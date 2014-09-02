require 'pry'
require 'httparty'

#server = TCPServer.new 2000


puts "gimme a tag?"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=40eb15cb18e94f7db90a3ee37208f21b")
puts response["data"][0]["images"]["standard_resolution"]["url"]


#homework lab:
#create search bar with tag...and press search
#takes me to a page associated with an image associated with the search