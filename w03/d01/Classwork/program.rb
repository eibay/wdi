require "pry"
require "httparty"

puts "Gimme at tag?"
tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=a0553208d1d54032842781cb526dc6c8", headers: {"User-Agent" => "Httparty"})


binding.pry

puts response.last

response["data"][0]


