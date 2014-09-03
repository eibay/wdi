require 'pry'
require 'json'
require 'httparty'
require_relative './models/bill.rb'
require_relative './models/senator.rb'
require_relative './db/connection.rb'


senators_api = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?fields=first_name,last_name,state,bioguide_id,party,birthday,term&term_end=2015-01-03&title=Sen&per_page=all&apikey=1768f8116fa5471f9b0849e35709e64b")["results"]

Senator.delete_all

senators_api.each do |element|
	senator = Senator.new(bioguide_id: element["bioguide_id"], first: element["first_name"], last: element["last_name"], state: element["state"], birthday: element["birthday"], party: element["party"])

	senator.save
end

################# limit 10 bills for each senator
# ********* do some kind of instance method to string interpolate the bioguide_id into a sponsor_id search in the API query
# ********* then loop through all the senators with the method

senators = Senator.all 

senators.each do |senator|
	bills = senator.find_bills
		bills.each do |bill|
		 	bill = Bill.new
		 	bill.save #but i need the variables/columns
		end
end




########## getting replaced by above

bills_api = HTTParty.get("https://congress.api.sunlightfoundation.com/bills/search?chamber=senate&per_page=all&apikey=1768f8116fa5471f9b0849e35709e64b")["results"]

Bill.delete_all

bills_api.each do |element|
 	bill = Bill.new(senator_id: element["sponsor_id"], short_title: element["short_title"], pages: element["last_version"]["pages"], enacted: element["history"]["enacted"], introduced_on: element["introduced_on"])

	bill.save
 end


