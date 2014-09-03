require 'HTTParty'
require 'pry'

require_relative './db/connection.rb'
require_relative './models/senator.rb'
require_relative './models/bill.rb'

senator_data = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=1ff8cde6660f4ebaa6e14401503e0064") 

Senator.delete_all

senator_data["results"].each do |x|
	# binding.pry
  senators = Senator.new(first_name: x["first_name"], last_name: x["last_name"], state: x["state"], bioguide_id: x["bioguide_id"], party: x["party"], birthday: x["birthday"])
  	# binding.pry
  senators.save
end

bill_data = HTTParty.get ("https://congress.api.sunlightfoundation.com//bills?history.active=true&order=last_action_at&apikey=1ff8cde6660f4ebaa6e14401503e0064")

Bill.delete_all

bill_data["results"].each do |y|
  bills = Bill.new(short_title: y["short_title"], pages: y["pages"], enacted:y["enacted"], introduced: y["introduced"])
  bills.save


end

