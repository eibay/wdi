require 'pry'
require 'json'
require 'HTTParty'

require_relative './models/senator.rb'
require_relative './database/connection.rb'

senators_array = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=a6760ef4e4f147a09df891918e869be0')

Senator.delete_all


senators_array["results"].each do |senator|
	senator = Senator.new(
		first: senator["first_name"], 
		last: senator["last_name"], 
		state: senator["state"], 
		bioguide_id: senator["bioguide_id"], 
		party: senator["party"], 
		birthday: senator["birthday"])

	senator.save
end


bills_array = HTTParty.get('https://congress.api.sunlightfoundation.com/bills?chamber=senate&apikey=a6760ef4e4f147a09df891918e869be0')

Bill.delete_all

bills_array["results"].each do |bill|
	bill = Bill.new(
		short_title: bill["short_title"],
		number_of_pages: bill["pages"],
		enacted: bill["enacted"],
		date_introduced: bill["introduced_on"])

	bill.save
end
