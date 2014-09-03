require 'pry'
require 'httparty'

require_relative './models/senator.rb'
require_relative './models/bill.rb'
require_relative './db/connection.rb'

senator_info = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=all&apikey=c512ee4ec11346cf8880a9d96ccff855")

Senator.delete_all

senator_info["results"].each do |x|
	info= Senator.new({
		first_name: x["first_name"], 
		last_name: x["last_name"], 
		state: x["state"], 
		bioguide_id: x["bioguide_id"], 
		party: x["party"], 
		birthday: x["birthday"]
	})
	info.save
end


bills= HTTParty.get("http://congress.api.sunlightfoundation.com/bills/search?chamber=senate&per_page=all&apikey=c512ee4ec11346cf8880a9d96ccff855")

Bill.delete_all

bills["results"].each do |y|
	bill = Bill.create({
		bioguide_id: y["sponser_id"],
		short_title: y["short_title"],
		pages: y["pages"],
		enacted:y["history"]["enacted"],
		issued_on:y["issued_on"]
		})

	bill.save
end


