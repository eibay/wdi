require 'active_record'
require 'pg'


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
