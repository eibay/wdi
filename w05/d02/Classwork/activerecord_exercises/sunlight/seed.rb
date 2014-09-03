require 'json'
require 'httparty'
require 'pry'
require 'pg'
require 'active_record'
require_relative './db/connection'
require_relative './models/senator'
require_relative './models/bill'

senators = File.read('senators_formatted.json')
senators_json = JSON.parse(senators)["results"]

# bills = File.read('bills_formatted.json')
# bills_json = JSON.parse(bills)

senators_json.each do |senator|
	bioguide_id = senator["bioguide_id"]
	bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=#{bioguide_id}&apikey=915591423e2f46588b5f3cb83292056a&per_page=10")["results"]
	bills.each do |bill|
		data = Bill.new(short_title: bill["short_title"], pages: bill["pages"], enacted: bill["history"]["enacted"], introduced_on: bill["introduced_on"], senator_id: bill["sponsor_id"])
		data.save
	end
end
