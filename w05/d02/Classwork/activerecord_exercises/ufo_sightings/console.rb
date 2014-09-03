require_relative './lib/connection'
require 'pry'
require 'json'


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
binding.pry
	sighting = Sighting.new(sightings_hash)

	sighting.save

	end




