require 'pry'
require 'HTTParty'
require_relative './db/connection.rb'
bioArr = []
Senator.all.each do |poli|
	bioArr<<poli.bioguide_id
end
bioArr.each do |bio|
	response = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=#{bio}&per_page=10&order=introduced_on&apikey=c5fc05f9a80541f296b9e79ec240f292")
	response["results"].each do |bill|
		legis = Bill.create({
			sen_id: bill["sponsor_id"], 
			short_title: bill["short_title"], 
			length: (bill["last_version"] && bill["last_version"]["pages"]), 
			enacted: bill["history"]["enacted"], 
			intro_date: bill["introduced_on"]
		})
	end
end





# response = HTTParty.get("https: