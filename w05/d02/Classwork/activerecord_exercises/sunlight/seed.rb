require 'pry'
require 'httparty'

require_relative './senator.rb'
require_relative './bill.rb'
require_relative './connection.rb'

senators = HTTParty.get("http://congress.api.sunlightfoundation.com/legislators?term_end=2015-01-03&per_page=all&apikey=410ebf08032d4867b9f317a12fe39965")

Senator.delete_all

senators["results"].each do |info|
	senator = Senator.create({
		first: info["first_name"], 
		last: info["last_name"], 
		state: info["state"], 
		bioguide_id: info["bioguide_id"], 
		party: info["party"], 
		birthday: info["birthday"]
		})

	senator.save
	
	end

# Senator.all.each do |element|

# bioguide_id = element.bioguide_id

bills = HTTParty.get("http://congress.api.sunlightfoundation.com/bills/search?chamber=senate&per_page=all&apikey=410ebf08032d4867b9f317a12fe39965")

# bills = HTTParty.get("http://congress.api.sunlightfoundation.com/bills/search?sponsor_id=#{bioguide_id}&apikey=410ebf08032d4867b9f317a12fe39965&per_page=all")

Bill.delete_all

bills["results"].each do |id|
	bill = Bill.create({
		bioguide_id: id["sponsor_id"], 
		short_title: id["short_title"], 
		pages: id["last_version"] && id["last_version"]["pages"], 
		enacted: id["history"]["enacted"], 
		issued_on: id["last_version"] && id["last_version"]["issued_on"] 
		})

	bill.save

	end
# end