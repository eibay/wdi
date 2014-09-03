require_relative './connection.rb'
require_relative './lib/senator.rb'
require_relative './lib/bill.rb'
require 'httparty'
require 'pry'
require 'active_record'


bil = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?apikey=5405e84d984341a3b5d84610231876f9&per_page=all")
# sen = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?apikey=5405e84d984341a3b5d84610231876f9")
sen = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&apikey=5405e84d984341a3b5d84610231876f9&per_page=all")


Senator.delete_all

# array = []
sen["results"].each do |senator|
  if senator["term_end"] == "2015-01-03"
    first = senator["first_name"]
    last = senator["last_name"]
    state = senator["state"]
    bioguide_id = senator["bioguide_id"]
    party = senator["party"]
    birthday = senator["birthday"]

    data = {first: first, last: last, state: state, bioguide_id: bioguide_id, party: party, birthday: birthday}

    s = Senator.new(data)
    s.save
    # array << s
  end
end

Bill.delete_all

bil["results"].each do |bill|
  sponsor_id = bill["sponsor_id"]
  bill_id = bill["bill_id"] ##### need this?
  short_title = bill["short_title"]
  pages = bill["last_version"]["pages"]
  enacted = bill["history"]["enacted"]
  date_introduced = bill["introduced_on"]
 

  data = {bill_id: bill_id, sponsor_id: sponsor_id, short_title: short_title, pages: pages, enacted: enacted, date_introduced: date_introduced}

  b = Bill.new(data)
  b.save
  
end