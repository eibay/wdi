require 'pry'
require 'HTTParty'

puts "Gimme a tag"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=cd29458e23f648fa9359e75074f0d497")

img_url = response["data"][0]["images"]["standard_resolution"]["url"]  

puts img_url