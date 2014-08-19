
require 'pry'
require 'httparty'

puts "Gimme a tag?"
tag = gets.chomp

instagram_things = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4c08eb6f8fb948d581437e9315b48fb2")

puts instagram_things["data"][0]["images"]["standard_resolution"]["url"]

## Grab the most recent photo with this tag
## and output the url of the image to the user

binding.pry