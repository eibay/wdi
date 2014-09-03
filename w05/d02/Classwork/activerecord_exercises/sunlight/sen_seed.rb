require 'pry'
require 'HTTParty'
require_relative './db/connection.rb'

response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=35&apikey=c5fc05f9a80541f296b9e79ec240f292")

response["results"].each do |element|
	polit = Senator.create(
		fname: element["first_name"], 
		lname: element["last_name"], 
		state: element["state"], 
		bioguide_id: element["bioguide_id"], 
		party: element["party"], 
		birthday: element["birthday"])
end