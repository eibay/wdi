require 'pry'
require 'httparty'

puts "Search what?"
search = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{search}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

puts response["data"][0]["link"]

binding.pry
