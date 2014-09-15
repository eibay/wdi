require 'pry'
require 'httparty'
require 'json'
require 'nokogiri'
require 'open-uri'


# response = open("http://www.reddit.com")
# doc = Nokogiri::HTML(response)
# response.close


# # puts JSON.parse(response)



# file = Nokogiri::HTML(open('http://www.reddit.com'))

binding.pry

# doc.css('h3.r a').each do |link|
# puts link.content
# end


# response = HTTParty.get("http://www.omdbapi.com/?s=#{word}")