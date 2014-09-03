require 'pry'
require_relative './connection'

class Sighting < ActiveRecord::Base


end



Sighting.all.each do |n|
	puts n["duration"]
end

circles=Sighting.where(shape: "circle")
circles.each do |circle|
	puts circle[:shape]
end

random=Sighting.all.sample
puts random[:id]


sightings_1976=Sighting.where(sighted_at:  19760101..20061231)
sightings_1976.each do |sighting|
	puts sighting[:sighted_at]
end
sightings_august_2010=Sighting.where(sighted_at:  20100801..20100831)
sightings_august_2010.each do |sighting|
	puts sighting[:sighted_at]
end

last_sightings=Sighting.limit(10).order(sighted_at: :asc)


last_sightings.each do |sighting|
	puts sighting[:sighted_at]
end
