require_relative './connection.rb'
require_relative './lib/senator.rb'
require_relative './lib/bill.rb'
require 'httparty'
require 'pry'
require 'active_record'


bil = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?apikey=5405e84d984341a3b5d84610231876f9&per_page=all")
# sen = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=5405e84d984341a3b5d84610231876f9")
sen = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&apikey=5405e84d984341a3b5d84610231876f9&per_page=all")

bil2 = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?history.active=true&order=last_action_at&apikey=5405e84d984341a3b5d84610231876f9&per_page=all")

binding.pry


# sen["results"].each do |senator|
#   if senator["term_end"] == "2015-01-03"
#     first = senator["first_name"]
#     last = senator["last_name"]
#     state = senator["state"]
#     bioguide_id = senator["bioguide_id"]
#     party = senator["party"]
#     birthday = senator["birthday"]

#     data = {first: first, last: last, state: state, bioguide_id: bioguide_id, party: party, birthday: birthday}

#     s = Senator.new(data)
#     s.save

#   end
# end


# sen["results"].each do |senator|
#   first = senator["first_name"]
#   last = senator["last_name"]
#   state = senator["state"]
#   bioguide_id = senator["bioguide_id"]
#   party = senator["party"]
#   birthday = senator["birthday"]

#   data = {first: first, last: last, state: state, bioguide_id: bioguide_id, party: party, birthday: birthday}

#   s = Senator.new(data)
#   s.save

# end

# bil["results"].each do |bill|
#   short_title = bill["short_title"]
#   pages = bill["last_version"]["pages"]
#   enacted = bill["history"]["enacted"]
#   date_introduced = bill["introduced_on"]
#   sponsor_id = bill["sponsor_id"]
#   bill_id = bill["bill_id"] ##### need this?

 

#   data = {bill_id: bill_id, sponsor_id: sponsor_id, short_title: short_title, pages: pages, enacted: enacted, date_introduced: date_introduced}

#   b = Bill.new(data)
#   b.save
  
# end
