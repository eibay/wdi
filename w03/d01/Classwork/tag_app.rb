require 'httparty'
require 'pry'
puts "Gimme a tag, hooman"

tag = gets.chomp

response =HTTParty.get("https://api.instagram.com/v1/tags/winnerwinnerchickendinner/media/recent?client_id=1329647cd257431baaf97163e4ef2059")
response
