require 'socket'
require 'httparty'
require 'pry'

puts "Gimme a tag"
tag = gets.chomp
response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=f487e0636e6e44c396a32f49390219fe")

picshttp = []

response["data"].each do |a|
	picshttp.push a["link"]
end

puts picshttp[0]