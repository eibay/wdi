


require 'json'
require 'pry'
require_relative './connection'

class Sighting < ActiveRecord::Base

def self.to_seconds(sighting)

	if(sighting["duration"].to_i)
		if(sighting["duration"].include? "min")

			sighting_int=sighting["duration"].to_i
		 	sighting_seconds=sighting_int*60
		 	return sighting_seconds
		elsif(sighting["duration"].include? "hour")
			sighting_int=sighting["duration"].to_i
			sighting_seconds=sighting_int*3600
			return sighting_seconds
		elsif(sighting["duration"].include? "sec")
			

			sighting_int=sighting["duration"].to_i
		else
		sighting_int=0
		return sighting_int
		
		
		end
	else
		sighting_int=0
		return sighting_int
	end
		

end
end









sightings=JSON.parse(File.read("./ufo_formatted.json"))

Sighting.delete_all

sightings.each do |sighting|
	sighting["shape"][0]=''
	sighting["duration"]=Sighting.to_seconds(sighting)
	if(sighting["duration"].to_i==0)
		sightings.delete(sighting)
	end
	
	Sighting.create(sighted_at: sighting["sighted_at"], reported_at: sighting["reported_at"], location: sighting["location"], shape: sighting["shape"], duration: sighting["duration"], description: sighting["description"])
end

binding.pry

