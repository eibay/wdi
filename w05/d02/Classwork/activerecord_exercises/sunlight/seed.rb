require 'pry'
require 'json'
require_relative './models/senators'
require_relative './models/bills'
require_relative './db/connection.rb'
require 'HTTParty'

all_senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?term_end=2015-01-03&per_page=all&page=3&apikey=52f8cf8e38e0475c83b4fd46bcab01d7")

Senator.delete_all

all_senators["results"].each do |senator|

  top_bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?sponsor_id=#{senator["bioguide_id"]}&per_page=10&apikey=52f8cf8e38e0475c83b4fd46bcab01d7")

  senator = Senator.new(first_name: senator["first_name"], last_name: senator["last_name"], state: senator["state"],
  bioguide_id: senator["bioguide_id"], party: senator["party"], birthday: senator["birthday"])

  senator.save

  top_bills["results"].each do |bill|

    bill = Bill.new(short_title: bill["short_title"], pages: bill["last_version"]["pages"], enacted: bill["history"]["enacted"], date_introduced: bill["introduced_on"], bioguide_id: bill["sponsor_id"], senator_id: senator.id)

    bill.save
  end

end
