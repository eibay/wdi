require 'pry'
require 'HTTParty'

#Legistlators whose term ends on 01-03-2015

# legislators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?term_end=2015-01-03&apikey=52f8cf8e38e0475c83b4fd46bcab01d7")

legislators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?term_end=2015-01-03&per_page=50&page=3&apikey=52f8cf8e38e0475c83b4fd46bcab01d7")

#first, last, state, bioguide_id, party, birthday

binding.pry

legislators["results"].each do |senator|
  senator["first_name"]
  senator["last_name"]
  senator["state"]
  senator["bioguide_id"]
  senator["party"]
  senator["birthday"]
end
