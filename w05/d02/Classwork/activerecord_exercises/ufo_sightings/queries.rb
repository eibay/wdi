# Created a file called queries.rb and use ActiveRecord to query the database for the below information:
# Every UFO sighting with a shape of circle
# Find the ID of a random UFO sighting
# Every UFO sighting between 1975 and 2006
# Every UFO sighting in August of 2010
# Find the 10 oldest UFO sightings by date

# Every UFO sighting with a shape of circle
UFO_circle= UFO.where({ shape: " circle"}) 

UFO_circle.count
# = 108

# Find the ID of a random UFO sighting (#1)
UFO_id= UFO.find_by(id: rand(UFO.count))[:id] 

# Find the ID of a random UFO sighting (#2)
UFO_id = UFO.order("RANDOM()").first
UFO_id

# Find the ID of a random UFO sighting (#3)
UFO_id= UFO_id.all.sample
UFO_id

# Every UFO sighting between 1975 and 2006
list =[]
year = 1975
while year = 2006

# Every UFO sighting between 1975 and 2006 (when sighted_at/reported_at is a date and not an integer)
UFO_where = UFO.where(:sighted_at=> "19750101".."20070101")

# Every UFO sighting in August of 2010
UFO_aug = UFO.where(:sighted_at=> "20100801".."20100831")

# Find the 10 oldest UFO sightings by date
UFO_old = UFO.limit(10).order(sighted_at: :asc) #asc is ascending
