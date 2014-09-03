require_relative './connection'
require 'pry'
require 'JSON'

data = JSON.parse(File.read('./ufo_sightings/ufo_formatted.json'))

Sighting.delete_all

info = data.each do |a|
	Sighting.create(sighted_at: a["sighted_at"], reported_at: a["reported_at"], location: a["location"], shape: a["shape"], duration: a["duration"], description: a["description"])
end 

binding.pry