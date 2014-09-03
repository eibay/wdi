require 'pry'
require 'HTTParty'


require_relative './senator_information.rb'
require_relative './connection.rb'

senatorinformation = HTTParty.get("http://congress.api.sunlightfoundation.com/legislators?chamber=senate&in_office=true&term_end=2015-01-03&per_page=100&apikey=103c371ac6bb4705810b12c036bbbe42")
Senator.delete_all

senatorinformation["results"].each do |element|
  senator = Senator.create(first: element["first_name"], last: element["last_name"], state: element["state"], bioguide_id: element["bioguide_id"], party: element["party"], birthday: element["birthday"])
end

Bill.delete_all

Senator.all.each do |element|
  bioguide_id = element.bioguide_id

  billinformation = HTTParty.get("http://congress.api.sunlightfoundation.com/bills/search?sponsor_id=#{bioguide_id}&per_page=10&order=introduced_on&apikey=103c371ac6bb4705810b12c036bbbe42")

  billinformation["results"].each do |entity|
    bill = Bill.create({
      short_title: entity["short_title"], 
      pages: (entity["last_version"] && entity["last_version"]["pages"]), 
      enacted: entity["history"]["enacted"], 
      issued_on: (entity["last_version"] && entity["last_version"]["issued_on"]), 
      sponsor_id: entity["sponsor_id"]
    })
    
  end
end


