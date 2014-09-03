require_relative './connection'

class Ufo < ActiveRecord::Base
end

#1

Ufo.where(shape: " circle")

#2

Ufo.find_by(id: rand(Ufo.count)) ["id"]

# 3

sightings = Ufo.where(:sighted_at => "19750101".."20070101")

# 4

sightings = Ufo.where(:sighted_at => "20100801".."20100831")


# 5

Ufo.limit(10).order(sighted_at: :asc)