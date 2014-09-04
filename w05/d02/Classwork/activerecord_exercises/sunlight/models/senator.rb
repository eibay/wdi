require 'active_record'

class Senator < ActiveRecord::Base

# ********* do some kind of instance method to string interpolate the bioguide_id into a sponsor_id search in the API query
# ********* then loop through all the senators with the method


	def find_bills
		@bioguide_id = bioguide_id
# ********* look up search term when i have the internet sponsor_id=#{@bioguide_id}
# ********* look up order by introduced_on when i have the internet 
		
		#search?chamber=senate&sponsor_id=#{@bioguide_id}
		bills_api = HTTParty.get("https://congress.api.sunlightfoundation.com/bills/search?chamber=senate&sponsor_id=#{@bioguide_id}&per_page=10&apikey=1768f8116fa5471f9b0849e35709e64b")["results"]

	end

end

# per page = 10 and order = introduced_on
# sponsor_id = bioguide_id
