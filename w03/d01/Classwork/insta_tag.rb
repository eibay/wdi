require "socket"
require "HTTParty"
require "pry"
puts "Gimme a tag"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=3afaee9a98b343d580e11c3228a8653d")

pics = []
response["data"]. each do |a|
	pics.push a["link"]
end
puts pics