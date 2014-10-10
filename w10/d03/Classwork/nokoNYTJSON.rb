require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'


html = Nokogiri::HTML(open('http://www.nytimes.com'))

headlines = []

html.css('.story-heading a').each do |headline|
	headlines << {headline: headline.content, link: headline["href"]} 
end

File.open('./nytimes.txt', 'w') { |file| file.write(headlines.to_json)} 


get '/' do 
	file = File.open('./nytimes.txt')
end