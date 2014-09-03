  require 'pry'
  require 'httparty'

  require_relative './db/connection.rb'
  require_relative './models/senator.rb'
  require_relative './models/bill.rb'

  api_call = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?chamber=senate&term_end=2015-01-03&apikey=3ff38976a5114f27a35d49fa4f454f04")

  Senator.delete_all
  Bill.delete_all

  senator_bills = []
  api_call["results"].each do |s|
  senators = Senator.new(first: s["first_name"], last: s["last_name"], state: s["state"], bioguide_id: s["bioguide_id"], party: s["party"], birthday: s["birthday"])

  senator_bills << senators
  senators.save


  end

  senator_bills.each do |x|
  bioguide_id = x[:bioguide_id]
  api_call02 = bills = HTTParty.get("https://congress.api.sunlightfoundation.com/bills?chamber=senate&sponsor_id=#{bioguide_id}&per_page=10&&apikey=3ff38976a5114f27a35d49fa4f454f04")

  api_call02["results"].each do |b|
  bills = Bill.new(short_title: b["short_title"], pages: b["pages"], enacted: b["enacted"], introduced: b["introduced"], senator_id: b["sponsor_id"])

  bills.save

  end
end

 #binding.pry
