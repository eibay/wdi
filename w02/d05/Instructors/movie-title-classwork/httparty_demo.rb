require 'json'
require 'httparty'

word = "purrfect"
response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")
puts JSON.parse(response)