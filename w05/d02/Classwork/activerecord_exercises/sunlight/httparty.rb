require 'httparty'
require 'pry'


senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=338c20dbe9c94a6eb34310b685811363")
binding.pry

bioguide = ""
senators["results"].each do |id|
	bioguide = id["bioguide_id"]
end 
bills=[]
bioguide. each do |a|
	bioguide_id = a 
	bills << HTTParty.get("https://congress.api.sunlightfoundation.com/bills/search?sponsor_id=#{bioguide_id}/order=introduced_on_asc/per_page=10&page=1&apikey=338c20dbe9c94a6eb34310b685811363")
end 

bills
binding.pry