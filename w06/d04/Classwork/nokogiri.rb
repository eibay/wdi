require 'nokogiri'
require 'open-uri'
require 'pry'
require 'sinatra'
require 'json'

get '/reddit'  do
	
	doc = Nokogiri::HTML(open('http://www.reddit.com'))

	stories= doc.css('p.title')

	titles=[]

	stories.each do |story|

		title= story.text
		link=story.css('a').attribute('href').to_s

		story_hash = {title: title, link: link}
		titles.push(story_hash)

	end

	return titles.to_json

end
