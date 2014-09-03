require 'json'
require 'pry'
require_relative "./connection.rb"
require_relative "./sighting.rb"


ufo_sightings = JSON.parse(File.read("./ufo_formatted.json"))

ufo_sightings.each do |sighting|
	sighting = Sighting.new({
		sighted_at: sighting["sighted_at"].strip,
		reported_at: sighting["reported_at"].strip,
		location: sighting["location"].strip,
		shape: sighting["shape"].strip,
		duration: sighting["duration"].strip,
		description: sighting["description"].strip,
		})
	sighting.save
end



