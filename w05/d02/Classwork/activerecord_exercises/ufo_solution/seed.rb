require 'pry'
require 'json'

require_relative './models/sighting.rb'
require_relative './db/connection.rb'

sightings_array = JSON.parse(File.read("./db/ufo_formatted.json"))

Sighting.delete_all #handles the duplication issue if seed.rb is run more than once

sightings_array.each do |element|
	sighting = Sighting.new(sighted_at: element["sighted_at"], reported_at: element["reported_at"], location: element["location"], shape: element["shape"], duration: element["duration"], description: element["description"])

	sighting.save
end




