#Queries
#Every UFO sighting with a shape of circle
Sighting.where({shape: " circle"})
sighting.shape

# Find the ID of a random UFO sighting
Sighting.all.sample
sighting.id

Sighting.order("RANDOM()").first
sighting.id

#Every UFO sighting between 1975 and 2006
sightings = Sighting.where(:sighted_at => "19750101".."20070101")

#Every UFO sighting in August of 2010
sightings = Sighting.where(:sighted_at => "20100801".."20100831")

#Find the 10 oldest UFO sightings by date
Sighting.limit(10).order(sighted_at: :asc)

#limit specifies how many to retrieve
#order = which direction:
# asc = ascending
# dsc = descending