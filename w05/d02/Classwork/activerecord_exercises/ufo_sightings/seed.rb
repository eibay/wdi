require 'json'
require_relative "./sighting.rb"


      # load json file # 

json_file = File.open "./ufo_formatted.json"
sightings = JSON.load json_file


       # main loop #

sightings.each do |sighting|

  Sighting.new(
   sighted_at: sighting["sighted_at"],
  reported_at: sighting["reported_at"],
     location: sighting["location"],
        shape: sighting["shape"],
     duration: sighting["duration"],
  description: sighting["description"]
  ).save

end 

