require 'pry'
require 'httparty'

require_relative './model/bill'
require_relative './model/senator'
require_relative './db/connection.rb'

senators = HTTParty.get("https://congress.api.sunlightfoundation.com/legislators?fields=first_name,last_name,state,bioguide_id,party,birthday,?per_page=all&term_end=2015-01-03&apikey=9c7546ce0ccf4ac496e644d0d5ba2521")["results"]

bill = httparty.get('https://')['result']

Senator.delete.all

senator_array[]

senator_api.each do |element|
senators = Senator.new(first_name: element["first_name"], last_name: element["last_name"], state: element["state"], bioguide_id: element["bioguide_id"], party: element["party"], birthday: element["birthday"])

senators.save

end

bill_array.each do |element2|
boobooo = Booobooo.new()