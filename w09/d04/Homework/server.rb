require 'sinatra'
require 'json'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
   
page = Nokogiri::HTML(open("http://www.nytimes.com/"))   

headlines = []

page.css("h2.story-heading a").each do |element|
	headlines << {title: element.text, link: element.attr("href")}
end

## excute above before own api be prohibitted ##

get "/" do
	headlines.to_json
end