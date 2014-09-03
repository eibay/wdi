require 'pry'
require 'json'
require 'httparty'
require_relative './models/senator.rb'
require_relative './models/bill.rb'
require_relative './db/connection.rb'


senators_array = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=f039c43943ab4b7f9d7da97843ca9f17", headers: {"User-Agent" => "Httparty"})["results"]

Senator.delete_all

senators_array.each do |crook|
	senator = Senator.new(first_name: crook["first_name"], last_name: crook["last_name"], state_name: crook["state_name"], bioguide_id: crook["bioguide_id"], party: crook["party"], birthday: crook["birthday"])
	senator.save
end


senators_bills_array = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?chamber=senate&apikey=f039c43943ab4b7f9d7da97843ca9f17", headers: {"User-Agent" => "Httparty"})["results"]

Bill.delete_all

senators_bills_array.each do |doc|
	bill = Bill.new(sponsor_id: doc["sponsor_id"], short_title: doc["short_title"], pages: doc["pages"], enacted: doc["history"]["enacted"], introduced_on: doc["introduced_on"])
	bill.save
end

bills.each do
	bill_by_senator = Bills.where(:sponsor_id) == Senators.where(bioguide_id:)
	bills_by_senator.push(bill_by_senator)
binding.pry

# Bills
# filter-sponsor_id = bioguide_id
# limit-per_page = 10
# sortby-order = introduced on date

# # senators whos term ends 20150103 "chamber"
# # senators["results"]["chamber"][2]["term_end"] "2015-01-03"

# # senators for each do



