require 'pry'
require 'httparty'

puts "Search what?"
search = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent/?access_token=229784585.1fb234f.8aa971f46d2245e9815d8272fed99c4e")
Request URL
Send 


puts response["data"][0]["link"]

binding.pry