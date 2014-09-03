require 'json'
require 'httparty'
require 'pry'
require_relative './senator'
require_relative './connection'
require_relative './bill'

# senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=all&apikey=26d1bf127acb4dcf9c3c79007102d97e")

# Senator.delete_all

# senators["results"].each do |senator|
# 	record = {
# 		first: senator["first_name"],
# 		last: senator["last_name"],
# 		state: senator["state"], 
# 		bioguide_id: senator["bioguide_id"],
# 		party: senator["party"],
# 		birthday: senator["birthday"]  
# 	}
# 	Senator.create(record)
# end

Bill.delete_all

Senator.all.each do |senator|
	bill = HTTParty.get("https://congress.api.sunlightfoundation.com/bills/search?sponsor_id=#{senator['bioguide_id']}&per_page=all&apikey=26d1bf127acb4dcf9c3c79007102d97e")
	bill["results"].each do |bill|
		record = Bill.new 
		record.official_title = bill["official_title"]
		record.short_title = bill["short_title"]
		if bill["last_version"] && bill["last_version"]["pages"]
			record.pages = bill["last_version"]["pages"]
		end
		record.enacted = bill["history"]["enacted"]
		record.introduced = bill["introduced_on"]
		record.sponsor_id = bill["sponsor_id"]
		record.save
	end
end

binding.pry