require "sinatra"
require "sinatra/reloader"
require "pry"
require "nokogiri"
require "json"
require "open-uri"


	page.css("h2.story-heading a").to_a.each do |headline|
		hash = {}
		hash[:link] = headline.attr("href")
		hash[:headline] = headline.text
		headlines << hash
	end
	headlines.to_json
end


