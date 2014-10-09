require "httparty"
require 'nokogiri'
require "pry"
require 'open-uri'
require "json"
require "sinatra"
require "sinatra/reloader"

headlines = []

get("/") do
	parsed = Nokogiri::HTML(open("http://www.nytimes.com/"))

	
	parsed.css("h2.story-heading a").each do |element|
		headlines << {title: element.text, link: element.attr("href")}
	end

	
end

get("/headlines") do
	headlines.to_json
end
