# require 'sinatra'
require 'pry'

# all_characters = []

# cast = File.read("./greys.txt")

# entries = cast.split("\n")
# individual_entry = entries[0]
# split_individual_entry = individual_entry.split(",")
# character_name = split_individual_entry[1]
# actor = split_individual_entry[0]
# episodes = split_individual_entry[2]
# active_years = split_individual_entry[3]
# start_year = active_years.split("-")[0]
# end_year = active_years.split("-")[1]

# cast_info[:character_name] = character_name
# cast_info[:actor] = actor
# cast_info[:episodes] = episodes
# cast_info[:start_year] = start_year
# cast_info[:end_year] = end_year


# Analyze
# Stars: Create an array with the names of all the actors who have acted in more than 150 episodes.
# Minor peeps: Count how many actors have been in less than 10 episodes.
# Dr. please!: Create an array of all the character's with the word "Dr." in their title.
# 2007: Create an array of all the characters who were on the show in 2007. (NOTE - they may have started before 2007 and ended afterwards.)

all_actors = []

file = File.read("./greys.txt")

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

all_actors.each do |x| 
	if x[:episodes] > 150
	stars.push(x[:character])
	end
end

minors = []

all_actors.each do |x| 
	if x[:episodes] < 10
	minors.push(x[:character])
	end
end

doctors = []

all_actors.each do |x| 
	if x[:character].include?("Dr.")
	doctors.push(x[:character])
	end
end

ohseven = []

all_actors.each do |x| 
	if x[:start_year] <= 2007 && x[:end_year] >= 2007
	ohseven.push(x[:character])
	end
end