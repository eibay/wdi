
https://api.instagram.com/v1/media/popular?client_id=CLIENT-ID

https://api.instagram.com/v1/media/popular?client_id=f9f86dbac5d7478c8e325fb20ea506b1
CLIENT INFO
CLIENT ID	f9f86dbac5d7478c8e325fb20ea506b1
CLIENT SECRET	2498453196f240ddbb9385796e2a1054
WEBSITE URL	http://google.com
REDIRECT URI	http://google.com

HTTParty.get("https://api.instagram.com/v1/media/popular?client_id=f9f86dbac5d7478c8e325fb20ea506b1")

a["data"][0]["username"]

require 'httparty'
def tagme
	puts "give me a tag"
	tag = gets.chomp
	response = "https://api.instagram.com/v1/tags/#{tag}/media/recent?client_id=f9f86dbac5d7478c8e325fb20ea506b1"
	# response = "https://api.instagram.com/v1/tags/nofilter/media/recent?client_id=f9f86dbac5d7478c8e325fb20ea506b1"
	r = HTTParty.get(response)
	puts r["data"].first["images"]["standard_resolution"]


	# puts response_parsed["data"].first["comments"]["data"]
end

