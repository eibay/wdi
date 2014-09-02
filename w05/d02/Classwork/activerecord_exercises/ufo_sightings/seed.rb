require 'active_record'
require 'json'
require 'pg'

# load json file # 

f = File.open "./ufo_formatted.json"
arr = JSON.load f


# establish connection w/ postgres # 

ActiveRecord::Base.establish_connection(
  adapter:    "postgresql",
  host:       "localhost",
  database:   "ufo_sightings",
  username:   "clayreed",
  password:   "",
  encoding:   "utf-8", 
  port:       "5432"
)


# make a UFO class # 

class UFO < ActiveRecord::Base 

end 


# main loop #

arr.each do |ufo|
  s = ufo["sighted_at"]
  r = ufo["reported_at"]
  l = ufo["location"]
  s = ufo["shape"]
  dura = ufo["duration"]
  desc = ufo["description"]
  obj = UFO.new(sighted_at: s, reported_at: r, location: l, shape: s, duration: dura, description: desc)
  obj.save 
end 
