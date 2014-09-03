require_relative "./senator"
require_relative "./connection"
require "httparty"
require "pry"

response = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=all&apikey=3897dc0e16544aaa97acca11b29a104b")

Senator.delete_all

response["results"].each do |item|
	legislator = {
		first: item["first_name"],
		last: item["last_name"],
		state: item["state_name"],
		bioguide_id: item["bioguide_id"],
		party: item["party"],
		dob: item["birthday"]
	}
	senator = Senator.new(legislator)
	senator.save
end


