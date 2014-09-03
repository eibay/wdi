# circle
Sighting.where({shape: " circle"})

#random
sighting = Sighting.order("RANDOM()").first
sighting.id

sighting = Sighting.all.sample
sighting.id

# 1975 - 2006
sightings = Sighting.where(:sighted_at => "19750101".."20070101")

bills = Bills.where(:sponsor_id => HDS654)

# august 2010
sightings = Sighting.where(:sighted_at => "20100801".."20100831")

# oldest 10
Sighting.limit(10).order(sighted_at: :asc)
