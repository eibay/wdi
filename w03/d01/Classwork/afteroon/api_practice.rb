require 'pry'
require 'json'
require 'socket'
require 'HTTParty'

puts "Give me a tag?"
tag = gets.chomp

instagram_things = Httparty.get("https://api.instagram.com/v1/tags/#{tags}/media/recent?access_token=187838632.f59def8.14cccf7a0e4149e9821f09c4e25720f4")

puts instagram_things["data"][0]["images"]["standard_resolution"]["url"]

## Grab the most recent photo with this tag
## Output the url

