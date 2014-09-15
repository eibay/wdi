require 'nokogiri'
require 'sinatra'
require 'sinatra/reloader'
require 'open-uri'
require 'json'
require 'pry'

get ("/reddit") do
	content_type :json
	
	reddit = Nokogiri::HTML(open('http://www.reddit.com'))

	results = []
	# reddit.css(".title a").each do |thing|
	# 	result = {}
		# if thing["href"].include?("http")
		# 	result[:title] = thing.content
		# 	result[:link] = thing["href"]
		# 	results << result
		# end

		reddit.css("div.thing").each do |thing|
			result = {}
			if thing.at_css("div.score.unvoted")
				result[:vote] = thing.at_css("div.score.unvoted").content
			end
			if thing.at_css(".title a")
				result[:title] = thing.at_css(".title a").content
			end
			if thing.at_css(".title a")
				result[:link] = thing.at_css(".title a")["href"]
			end
			results << result
		end
	# end	 
	results.to_json
end