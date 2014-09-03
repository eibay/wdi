require_relative "./connection.rb"
require_relative "./sighting.rb"
require 'pry'

print Sighting.where({shape: "circle"})

print Sighting.all.sample
# Every UFO sighting between 1975 and 2006
print Sighting.where({sighted_at: "19750101".."20061231"})

print Sighting.where({sighted_at: "20100801".."20100831"})
# Find the 10 oldest UFO sightings by date
print Sightin.limit(10).order(sighted_at: :asc)