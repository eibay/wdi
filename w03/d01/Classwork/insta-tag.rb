require 'httparty'
require 'pry'

puts "Gime a tag?"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

=begin
Grab the most recent photo with this tag and output the url of the image to the user
Write a command line ruby app that ask the user for a tag and then you put in the tag,
which could be no filter and outcomes the most recent image for the url for the recent image.
No filter is the tag.
=end

puts response["data"][0]["images"]["low_resolution"]["url"]