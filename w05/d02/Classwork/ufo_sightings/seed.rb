require 'pry'
require 'json'

require_relative './models/sighting.rb'
require_relative './db/connection.rb'

ufo_sightings = JSON.parse(File.read('./sightings.txt'))

Sighting.delete_all

ufo_sightings.each do |element|
  sighting = Sighting.new( sighted_at: element["sighted_at"], reported_at: element["reported_at"], location: element["location"], shape: ["shape"], duration: element["duration"], description: element["description"] )

sighting.save

end





