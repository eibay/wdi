require_relative "./models"
require_relative "./sunlight"


# seed senators table # 
senators_up_for_reelection = find_senators_by_term_end "2015-01-03"

senators_up_for_reelection.each do |senator|
 	Senator.new(
 	 	 first_name: senator["first_name"],
 	 	  last_name: senator["last_name"],
 	 	 state_name: senator["state_name"],
 	 	bioguide_id: senator["bioguide_id"],
 	 	      party: senator["party"],
 	 	   birthday: senator["birthday"]
 	 	).save
	bills = find_bills_by_sponsor_id senator["bioguide_id"][0,10]
	# seed bills table # 
	bills.each do |bill|
		Bill.new(
			short_title: bill["short_title"], 
			pages: bill["pages"], 
			enacted: bill["history"]["enacted"], 
			introduced_on: bill["introduced_on"]
			).save 
	end 
 end 
