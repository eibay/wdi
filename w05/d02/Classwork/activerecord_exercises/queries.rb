require 'pry'

require './connection'


# Every UFO sighting with a shape of circle
binding.pry
circle_UFOs = Sighting.where({shape: " circle"})

puts circle_UFOs


# Find the ID of a random UFO sighting

random_UFO = Sighting.take

puts random_UFO
#other solutions:

Sighting.order("RANDOM()").first

Sighting.all.sample

# Every UFO sighting between 1975 and 2006


range = Sighting.where(sighted_at: 19750000 .. 20069999)
puts range


#if sighted_at is a date
sightings = Sighting.where(:sighted_at =>19750101 .. 20061231)

# Every UFO sighting in August of 2010

range_aug = Sighting.where(sighted_at: 20100800 .. 20100831)
puts range_aug
# Find the 10 oldest UFO sightings by date

first_sightings = Sighting.order("sighted_at").first(10)
puts first_sightings




