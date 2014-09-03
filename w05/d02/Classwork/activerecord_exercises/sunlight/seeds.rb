require 'httparty'
require 'pry'
require "./connection.rb"

senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=338c20dbe9c94a6eb34310b685811363")

Senator.delete_all

senators["results"].each do |a|
	Senator.create({first: a["first_name"], last: a["last_name"], state: a["state"], bioguide_id: a["bioguide_id"], party: a["party"], birthday: a["birthday"]})
end

senators["results"].each do |a|
	a["bioguide_id"] 


bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills/search?apikey=338c20dbe9c94a6eb34310b685811363")
Bill.delete_all

bills["results"].each do |a|
	Bill.create({name: a["official_title"], page_count: a["last_version"]["pages"], enacted: a["history"]["enacted"], introduced_on: a["introduced_on"], sponsor_id: a["sponsor_id"]})
end 
