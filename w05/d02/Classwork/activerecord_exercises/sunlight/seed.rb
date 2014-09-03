require_relative './connection'
require_relative './senator'
require_relative './bill'
require 'httparty'
require 'pry'


# file=HTTParty.get("https://congress.api.sunlightfoundation.com/bills?apikey=7ebd185a62c445bb86334ff11d3811cf&per_page=10&sponsor_id=W000818")
# binding.pry
# Senator.delete_all

# file["results"].each do |senator|

# 	add=Senator.new
# 	add.bioguide_id=senator["bioguide_id"]
# 	add.first=senator["first_name"]
# 	add.last=senator["last_name"]
# 	add.state=senator["state_name"]
# 	add.party=senator["party"]
# 	add.birthday=senator["birthday"]
# 	add.save
# end

Bill.delete_all
Senator.all.each do |senator|
	file=HTTParty.get("https://congress.api.sunlightfoundation.com/bills?apikey=7ebd185a62c445bb86334ff11d3811cf&per_page=10&sponsor_id=#{senator.bioguide_id}")
	file["results"].each do |bill|
		

		add=Bill.new
		if(bill["short_title"] != nil)
			add.short_title=bill["short_title"]
		else
			add.short_title=bill["official_title"]
		end

	
		
		if(bill["last_version"] != nil)
			add.pages=bill["last_version"]["pages"]
		end
		
		add.bioguide_id=bill["sponsor_id"] 
	
	
		add.enacted=bill["history"]["enacted"] 
	
	
		add.introduced=bill["introduced_on"]
	
		add.save
	end
end










# # 7ebd185a62c445bb86334ff11d3811cf