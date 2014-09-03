require_relative './connection'
require 'pry'

class UFO < ActiveRecord::Base
end

  # - Every UFO sighting with a `shape` of `circle`
  # - Find the ID of a random UFO sighting
  # - Every UFO sighting between 1975 and 2006
  # - Every UFO sighting in August of 2010
  # - Find the 10 oldest UFO sightings by date

# Circle
# 
UFO.where(shape: " circle")

# Random
# 
UFO.all().sample.id

UFO.order("RANDOM()").first

# 1975-2006
# 
array = []
UFO.all.each do |y|
	if y[:sighted_at].to_s[0..3].to_i >= 1975 && y[:sighted_at].to_s[0..3].to_i <= 2006
		puts y[:sighted_at].to_s[0..3].to_i
		array << y.sighted_at
	end
end
put array.count

UFO.where(sighted_at: "19750101".."20070101")

# August 2010
# 
aug_array = []
UFO.all().each do |x|
	if x[:sighted_at].to_s[0..5].to_i == 201008
		puts x[:sighted_at]
		aug_array << x.sighted_at
	end
end

puts aug_array.count


# Oldest 10
# 
UFO.limit(10).order(sighted_at: :asc)


binding.pry