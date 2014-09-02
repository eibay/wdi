require 'active_record'
require 'json'
require 'pg'

      # load json file # 

json_file = File.open "./ufo_formatted.json"
ufo_hash_arr = JSON.load json_file


# establish connection w/ postgres # 

ActiveRecord::Base.establish_connection(
   adapter: "postgresql",
      host: "localhost",
  database: "ufo_sightings",
  username: "clayreed",
  password: '',
  encoding: "utf-8", 
      port: "5432"
)


    # make a UFO class # 

class UFO < ActiveRecord::Base 
end 


       # main loop #

ufo_hash_arr.each do |ufo|

  UFO.new(
   sighted_at: ufo["sighted_at"],
  reported_at: ufo["reported_at"],
     location: ufo["location"],
        shape: ufo["shape"],
     duration: ufo["duration"],
  description: ufo["description"]
  ).save

end 

