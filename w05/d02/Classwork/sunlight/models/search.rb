require 'pry'
require 'httparty'
require 'active_record'

senators["results"].each do |id|
senator = Senator.create({
first_name: id["first_name"], 
last_name: id["last_name"], 
state: id["state"],
bioguide_id: id["sponsor_id"],
party: id["party"], 
birthday: id["date"],
term_end: id["date"] 
})

senators.save

end

bills["results"].each do |id|
bill = Bill.create({
bioguide_id: id["sponsor_id"], 
short_title: id["short_title"], 
pages: ["last_version"] && id["last_version"]["pages"], 
enacted: id["history"]["enacted"], 
issued_on: id["last_version"] && id["last_version"]["issued_on"] 
})

bills.save

end
