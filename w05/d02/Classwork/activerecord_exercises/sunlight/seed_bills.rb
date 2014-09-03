require_relative "./bill"
require_relative "./senator"
require "httparty"
require "pry"



Bill.delete_all

repo = Senator.all.each

senators = []

repo.each do |senator|
	senators << senator
end

senators.each do |senator|

	response = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=#{senator.bioguide_id}&apikey=3897dc0e16544aaa97acca11b29a104b")
	if response["results"].length >= 10
		response["results"][0..9].each do |bill|
			if bill["last_version"]
				frame = {
					short_title: bill["short_title"],
					senator_id: senator.id,
					pages: bill["last_version"]["pages"],
					introduced: bill["introduced_on"],
					enacted: bill["history"]["enacted"]
				}
				frame[:short_title] ||= bill["bill_id"]
				bill = Bill.new(frame)
				bill.save
			end
		end
	else
		response["results"].each do |bill|
			frame = {
				short_title: bill["short_name"],
				senator_id: senator.id,
				pages: bill["last_version"]["pages"],
				introduced: bill["introduced_on"],
				enacted: bill["history"]["enacted"]
			}
			frame[:short_title] ||= bill["bill_id"]
			bill = Bill.new(frame)
			bill.save
		end

	end

end


