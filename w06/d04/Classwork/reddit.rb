require 'httparty'
require 'sinatra'
require 'nokogiri'
require 'open-uri'
require 'pry'

get("/reddit") do

doc = Nokogiri::HTML(open('http://www.reddit.com/'))

thearray = []                                                     

	doc.css('a.title').each do |x|                                  
		thehash = {}
		thehash["title"] = x.text
		thearray << thehash                                               
	end                                                             

end