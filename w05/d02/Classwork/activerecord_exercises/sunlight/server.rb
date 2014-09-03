require 'pry'
require 'httparty'
require_relative './db/connection.rb'
require_relative './models/senator.rb'
require_relative './models/bill.rb'

senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=c8afc9366159477581e3be0a4045b6f5&per_page=all")

Senator.delete_all
Bill.delete_all

sen_array = []
senators["results"].each do |s|
	if s["term_end"] == "2015-01-03" 
		sen_hash = {
		first: s["first_name"],
		last: s["last_name"],
		state: s["state"],
		bioguide_id: s["bioguide_id"],
		party: s["party"],
		birthday: s["birthday"]
		}
		Senator.create(sen_hash)
		sen_array << sen_hash
	end
end

sen_array.each do |x|
	bioguide_id = x[:bioguide_id]
	bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?chamber=senate&sponsor_id=#{bioguide_id}&per_page=10&apikey=c8afc9366159477581e3be0a4045b6f5")
	
	bills["results"].each do |b|
		bill_hash = {
		short_title: b["short_title"],
		pages: b["pages"],
		enacted: b["enacted"],
		introduced: b["introduced_on"],
		senator_id: b["sponsor_id"]
		}
		Bill.create(bill_hash)
	end
end

# first_10 = Bill.limit(10).order(introduced: :asc)

# array = []
# bill_array.each do |y|
# 	introduced_on = y[:introduced_on]
# 	sponsor_id = y[:senator_id]
# 	bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?chamber=senate&sponsor_id=#{sponsor_id}&apikey=c8afc9366159477581e3be0a4045b6f5&order=#{introduced_on}&per_page=10")

# 	bills["results"].each do |b|
# 		bill_hash = {
# 		short_title: b["short_title"],
# 		pages: b["pages"],
# 		enacted: b["enacted"],
# 		introduced: b["introduced_on"],
# 		senator_id: b["sponsor_id"]
# 		}
# 		array << bill_hash
# 	end 
# end 

binding.pry
















