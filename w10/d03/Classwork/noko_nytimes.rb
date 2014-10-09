require 'nokogiri'
require 'open-uri'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'json'


get('/') do
doc=Nokogiri::HTML(open("http://www.nytimes.com"))
stories=[]
	doc.css("h2.story-heading a").each do |title|
		if(title != nil)
			stories.push({title:title.text, link:title["href"]})
		end
	
		
	end

	json = stories.to_json
	file = File.open('nytimes_json.txt', 'w')
	file.write(json)
	file.close
end

get('/returnjson') do
	file = File.open('nytimes_json.txt', 'r')
	json = file.read
	puts JSON.parse(json)
	json
end