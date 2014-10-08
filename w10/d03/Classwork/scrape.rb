require 'sinatra'
require 'json'
# require 'open-uri'
require 'nokogiri'
require 'httparty'
require 'pry'

html = HTTParty.get('http://www.nytimes.com/') 
parsed = Nokogiri::HTML(html)


# parsed.css("h1").each do |element|
# 	puts element.text
# end

# gets headline and URL

headlines = []
parsed.css("h2.story-heading a").each do |element|
	headlines << { title: element.text, link: element.attr("href") }
end

get "/" do
	headlines.to_json
end

# binding.pry