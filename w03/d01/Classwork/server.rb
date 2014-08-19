#simple server

# require 'HTTParty'
# require 'pry'
# puts "What tag do you want?"
# answer = gets.chomp.downcase

# response = HTTParty.get("https://api.instagram.com/v1/tags/#{answer}/media/recent?client_id=59f1ac61f0b547e4a6961cdf8b921cfe")
# picture = response["data"][0]["images"]["low_resolution"]["url"] 
# puts "#{picture}"

