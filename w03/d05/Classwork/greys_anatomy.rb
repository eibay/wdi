require 'pry'

all_actors = []

file = File.read("./morning_exercise/greys.txt")

file_array = file.split("\n")

file_array.each do |actor_string|
  actor_array = actor_string.split(",")
  hash = {}
  hash[:actor] = actor_array[0]
  hash[:character] = actor_array[1]

  episode_split = actor_array[2].split(" ")
  hash[:episodes] = episode_split[0].to_i

  if actor_array[3].include?("-")
    dates = actor_array[3].split("-")
    hash[:start_year] = dates[0].to_i
    hash[:end_year] = dates[1].to_i
  else
    hash[:start_year] = actor_array[3].to_i
    hash[:end_year] = actor_array[3].to_i
  end

  all_actors.push(hash)
end

  stars = []

  all_actors.each do |actor|
    if actor[:episodes] > 150
      stars.push(actor)
    end
  end

  minor_stars = []

  all_actors.each do |minor|
    if actor[:episodes] < 10
      minor_stars.push(actor)
    end
  end

  doctors = []

  all_actors.each do |d|
    if d[:character].include?("Dr.")
      doctors << d[:character]
    end
  end

  seven = []

  all_actors.each do |actor|
    # seven << actor[:character] if actor[:start_year] == 2007
    if actor[:start_year] <= 2007 && actor[:end_year] >= 2007
      seven << actor[:character]
    end
  end
#binding.pry











# require 'pry'

# greys = File.read("./morning_exercise/greys.txt")
# greys_split_line = greys.split("\n")

# greys_split_comma = []
# greys_split_line.each do |a|
#   greys_split_comma.push a.split(",")
# end


# greys_split_comma_dash= []
# greys_split_comma.each do |a|
#   if a[3].include?("-")
#   greys_split_comma_dash << a[3].split("-")
# end
# end


# characters = []
# greys_split_comma.each do |a|
#   hash = {}
#   hash[:character] = a[0]
#   hash[:actor] = a[1]
#   hash[:episodes] = a[2]

#   if a[3].include?("-")
#     years = a[3].split("-")
#     hash[:start_date] = years[0]
#     hash[:end_date] = years[1]
#     characters.push hash
#   else
#     hash[:start_date] = a[3]
#     hash[:end_year] = a[3]
#     characters.push hash
#     #binding.pry
# end
# end
# puts characters

# one_fifty_eps = []

# if characters[2].length > 150

#   end