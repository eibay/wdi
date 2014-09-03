require "httparty"
require "pry"
require_relative "./connection.rb"
require_relative "./senator.rb"
require_relative "./bill.rb"

senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=d113502cf6da4b1b81f74685b90e970b&chamber=senate&term_end=2015-01-03&per_page=50")
Senator.delete_all

senators["results"].each do |result|
	senator = Senator.new({
		first: result["first_name"],
		last: result["last_name"],
		state: result["state"],
		bioguide_id: result["bioguide_id"],
		party: result["party"],
		birthday: result["birthday"]
		})
	senator.save
end

bioguide_ids = []
	Senator.all.each do |sen|
		bioguide_ids.push(sen[:bioguide_id])
	end

	bioguide_ids.each do |bioguide_id|
		bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?apikey=d113502cf6da4b1b81f74685b90e970b&sponsor_id=#{bioguide_id}&per_page=10")	
			bills["results"].each do |x|	
			bill = Bill.new({
				short_title: x["short_title"],
				pages: x["pages"],
				enacted: x["enacted"],
				introduced_on: x["introduced_on"],
				sponsor_id: x["sponsor_id"]
				})
			bill.save
			end
	end



