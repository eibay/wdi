require 'pry'
require 'httparty'

# require_relative './models/senator.rb'
# require_relative './models/bill.rb'
# require_relative './db/connection.rb'

senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=f039c43943ab4b7f9d7da97843ca9f17", headers: {"User-Agent" => "Httparty"})
senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=f039c43943ab4b7f9d7da97843ca9f17", headers: {"User-Agent" => "Httparty"})

senate_bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?chamber=senate&apikey=f039c43943ab4b7f9d7da97843ca9f17", headers: {"User-Agent" => "Httparty"})["results"]

HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=W000818")

bills = Bills.where(:sponsor_id => HDS654)

binding.pry

Bills
filter-sponsor_id = bioguide_id
limit-per_page = 10
sortby-order = introduced on date

# circle
Sighting.where({shape: " circle"})

#random
sighting = Sighting.order("RANDOM()").first
sighting.id

sighting = Sighting.all.sample
sighting.id

# 1975 - 2006
sightings = Sighting.where(:sighted_at => "19750101".."20070101")

bills = Bills.where(:sponsor_id => HDS654)

# august 2010
sightings = Sighting.where(:sighted_at => "20100801".."20100831")

# oldest 10
Sighting.limit(10).order(sighted_at: :asc)


# senators whos term ends 20150103 "chamber"
# senators["results"]["chamber"][2]["term_end"] "2015-01-03"

# senators for each do



bills = Bills.where(:sponsor_id => HDS654)






