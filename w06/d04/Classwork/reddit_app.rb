require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'nokogiri'


get "/" do 

	path = HTTParty.get('http://www.reddit.com/')

	parsed = Nokogiri::HTML.parse(path)

	array = []
	parsed.css('a.title').each do |t|
		hash = {title: t.text, link: t["href"]}
		array << hash
	end

	array.to_json

	



	
end