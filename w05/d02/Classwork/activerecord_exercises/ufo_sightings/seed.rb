require_relative './model'
require 'active_record'
require 'json'
require 'pry'

ufo_sightings = JSON.parse(File.read('./ufo_formatted.json'))

Sighting.delete_all

ufo_sightings.each do |element|
  sighting = Sighting.new(sighted_at: element["sighted_at"], reported_at: element["reported_at"], location: element["location"], shape: element["shape"], duration: element["duration"], description: element["description"])

  sighting.save
end
