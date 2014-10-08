require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'httparty'
require 'nokogiri'
require 'open-uri'
require 'jason'



html = HTTParty.get("http://www.nytimes.com/")
parsed = Nokogiri::HTML(html)

headlines = []

parsed.css("h2.story-heading a").each do |element|
	headlines << { title: element.text, link: element.attr("href") }
end

get '/' do 

	headlines.to_json

end