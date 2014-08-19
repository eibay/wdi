puts "Give me a tag?"

tag = gets.chomp

response = HTTParty.get("https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=4ad7cc36c172434588afd340aa74cd01")

puts response["data"][0]["images"].first[1]["url"]