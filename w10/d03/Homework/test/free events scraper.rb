require "httparty"
require "nokogiri"
require "open-uri"
require "pry"


html = HTTParty.get("http://clubzone.com/new-york/events/")
parsed = Nokogiri::HTML(html)

headline = []

parsed.css("div.els_info").each do |element|
 headline << {title: element.css("h3 a").text, link: element.css("h3 a").attr("href").text, address: element.css("span a").text, description: element.css("div.els_excerpt p").text, date: element.css("time span") }
end

headline.each do |item|
	Event.create({
		title: item[:title], 
		address: item[:address],
		link: item[:link],
		description: item[:description],
		date: item[:date],
		category_id: 5
	})
end 

