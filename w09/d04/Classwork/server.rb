require "sinatra"
require "sinatra/reloader"
require 'nokogiri'
require 'open-uri'
require "json"
require "pry"
get("/") do 
	file=[]
	page = Nokogiri::HTML(open("http://nytimes.com/ "))  
	titles = page.css("h2.story-heading a") 
	
	titles.each do |element|
		file.push({title: element.text, link: element.attr("href")})
	end 
	
	file.to_json
end
