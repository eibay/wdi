require 'httparty'
require 'pry'
puts "Tag?"

tag = gets.chomp

url = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=6e4453d0a1e84159a1b28c13d09916cb")
url = url["data"]
url = url[0]
url =url["images"]["standard_resolution"]["url"] 



puts url
#puts url["data"][0]["link"]