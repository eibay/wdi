require_relative "./sighting.rb"
require 'pry'

      # shape of circle #

circular_sightings = Sighting.where(shape: "circle") 


     # random sighting id #

random_sighting = Sighting.all.sample 


     # from 1975 to 2006 #  

three_decades_and_a_year = Sighting.where(sighted_at: "19750101".."20070101") 


# all sightings in August 2010 #

august2010 = Sighting.where(sighted_at: "20100801".."20100831")


   # ten oldest sightings #  

ten_oldest = Sighting.limit(10).order(sighted_at: :asc)

binding.pry 