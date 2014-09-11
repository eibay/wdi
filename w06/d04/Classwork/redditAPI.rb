require "json"
require "nokogiri"
require "pry"
require "open-uri"
require "sinatra"
require "sinatra/reloader"

get "/" do

	reddit = Nokogiri::HTML(open("http://www.reddit.com"))
	anchors = reddit.css("div.sitetable div div.entry p.title a.title")
	scores = reddit.css("div.sitetable div div.midcol div.unvoted")

	index = 0
	complete = []
	while index < 25

		link = anchors[index]["href"]
		title = anchors[index].to_s.scan(/>.+</)[0][1..-2]
		upvotes = scores[index].to_s.scan(/>.+</)[0][1..-2]


		item = {
			position: (index + 1).to_s,
			title: title,
			link: link,
			upvotes: upvotes
		}

		complete << item

		index += 1
	end

	complete.to_json

end



	