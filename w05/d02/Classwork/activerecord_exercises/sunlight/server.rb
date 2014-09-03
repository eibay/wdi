require 'pry'
require 'httparty'
require_relative './models/senator.rb'
require_relative './models/bills.rb'
require_relative './db/connection.rb'

senators = HTTParty.get('https://congress.api.sunlightfoundation.com/legislators?per_page=all&chamber=senate&term_end=2015-01-03&apikey=5e33954a5dc741e4a538472eee2df7f7')['results']

Senator.delete_all
	
Bill.delete_all

senators.each do |element|
	senator = Senator.new(first: element['first_name'], last: element['last_name'], state: element['state'], bioguide_id: element['bioguide_id'], party: element['party'], birthday: element['birthday'] )

	bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?per_page=10&sponsor_id=#{element['bioguide_id']}&apikey=5e33954a5dc741e4a538472eee2df7f7")['results']


		bills.each do |element|
		bill = Bill.new(short_title: element["short_title"], pages: element["last_version"]["pages"], enacted: element["history"]["enacted"], introduced: element["introduced_on"], sponsor: element["sponsor_id"])
		
		bill.save
	end

	senator.save
end
binding.pry


