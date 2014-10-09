require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'HTTParty'
require 'pry'

get '/' do
  path = HTTParty.get('http://www.nytimes.com/')
  nyt_parsed = Nokogiri::HTML(path)

  nyt_array = []

 	nyt_parsed.css("h2.story-heading a").each do |element| #grabbing the corresponding headlines   
 	nyt_array << {title:element.text, link: element.attr("href")} #array of hashes, along with key-pair-values. in this case, we are looking for the titles of each article and their links
	
	end	
	nyt_array.to_json
end

