# Part 3 - Querying the Database

# Created a file called queries.rb and use ActiveRecord to query the database for the below information:
# Every UFO sighting with a shape of circle
# Find the ID of a random UFO sighting
# Every UFO sighting between 1975 and 2006
# Every UFO sighting in August of 2010
# Find the 10 oldest UFO sightings by date

# Every UFO sighting with a shape of circle
ufos_circle = Ufo.where(shape: " circle")
ufos_circle.count = 108

# Find the ID of a random UFO sighting
ufo_random_id = Ufo.find_by(id: rand(Ufo.count))[:id] #????


ufo = Ufo.order("RANDOM()").first
ufo.id

# or

ufo = Ufo.all.sample
ufo.id


# Every UFO sighting between 1975 and 2006


list = []
Ufo.all.each do |ufo|
  if ufo[:sighted_at].to_s[0..3].to_i <= 2006 && ufo[:sighted_at].to_s[0..3].to_i >= 1975
    list << ufo
  end
end
puts list

list.each do |ufo|
  ufo[:sighted_at]
end


ufo = Ufo.where(:sighted_at => "19750101"..."20070101") ########################

# Every UFO sighting in August of 2010

list_2010_aug = []
Ufo.all.each do |ufo|
  if ufo[:sighted_at].to_s[0..3] == "2010" && ufo[:sighted_at].to_s[4..5] == "08"
    list_2010_aug << ufo
  end
end

list_2010_aug.each do |ufo|
  ufo[:sighted_at]
end

ufo = Ufo.where(:sighted_at => "20100801"..."20100831") ########################
# Find the 10 oldest UFO sightings by date


