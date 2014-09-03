require_relative './db/connection'
require_relative './models/senator'
require_relative './models/bill'
require 'httparty'

senators = HTTParty.get("http://congress.api.sunlightfoundation.com/legislators?title=Sen&term_end=2015-01-03&apikey=8374d53b14ef4be8915448296fb91135&per_page=50")

senators["results"].each do |senator|
  Senator.create({
    fname: senator["first_name"],
    lname: senator["last_name"],
    state: senator["state"],
    party: senator["party"],
    bioguide_id: senator["bioguide_id"],
    birthday: senator["birthday"]
  })
end

Senator.all.each do |senator|
  bills = HTTParty.get("http://congress.api.sunlightfoundation.com/bills?sponsor_id=#{senator.bioguide_id}&apikey=8374d53b14ef4be8915448296fb91135&per_page=10&order=introduced_on")

  bills["results"].each do |bill|
    Bill.create({
      enacted: bill["history"]["enacted"],
      short_title: bill["short_title"],
      page_length: (bill["last_version"] && bill["last_version"]["pages"]),
      introduction_date: bill["introduced_on"],
      senator_bioguide_id: senator.bioguide_id
    })
  end
end