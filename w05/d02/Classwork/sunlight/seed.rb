require 'pry'
require 'json'
require 'httparty'

require_relative './models/legislator.rb'
require_relative './db/connection.rb'

legislators_hash = HTTParty.get("http://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&per_page=all&per_page=all&apikey=2c4dddcfb9b3478fbe8d75b336885abe")

Legistlators.delete_all

legistators_hash.each do |key, value|
	legislator = Legislator.new(first_name: "first_name", last_name: "last_name", party: "party", state: "state", phone_number: "phone_number", :term_end "term_end")

	legislator.save
end

bills_hash = HTTParty.get("http://congress.api.sunlightfoundation.com/bills/search/?chamber=senate&per_page=all&apikey=2c4dddcfb9b3478fbe8d75b336885abe")

Bills.delete_all

bills_hash.each do |key, value|
	bill = Bill.new(bioguide_id: "bioguide_id", short_title: "short_title", pages: "pages", enacted: "enacted", issued_on: "issued_on")

	bill.save
end