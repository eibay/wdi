require_relative './lib/connection'
require 'pry'
require 'json'

class Sighting < ActiveRecord::Base

	def self.create(entity)
	    entities = self.all()

	    entities.push(entity)
	    #File.write(self.file_name(), entities.to_json)
	end

end

sightings = JSON.parse(File.read('./ufo_formatted.json'))

	sightings.each do |x|
	sightings_hash = {
		sighted_at: x["sighted_at"],
		reported_at: x["reported_at"],
		location: x["location"],
		shape: x["shape"],
		duration: x["duration"],
		description: x["description"],
	}
	sighting = Sighting.new(sightings_hash)

	sighting.save

	end



# [999] {
#          "sighted_at" => "20100725",
#         "reported_at" => "20100806",
#            "location" => " Fair Oak (UK/England),",
#               "shape" => " fireball",
#            "duration" => "Two minutes",
#         "description" => "Two orange fireballs observedAt around 22:50 hours local time, on the evening of July 25th, 2010, a seventy-three year old male resident of the village of Fair Oak, Hampshire, England, happened to go outside in order to lock up his vehicle for the night.  It was while he was doing this that he happened to glance up into the sky and off towards the south-southeast and saw what seemed to be two distinct and very brilliant orange colored lights in the sky at probably not more than one-quarter mile from his observation point. According to the observer, the lights were flying vertically across the sky, with one trailing the other at a distance, estimated by the witness to be between six hundred and one thousand yards, and at an angle of approximately fifty degrees above the horizon.  Suddenly, the leading light source terminated its forward motion and made a sheer vertical acceleration, vanishing into the sky.  The trailing object continued on course, and in a matter of a few seconds was lost behind two story buildings, terminating his observation."
#     }  
