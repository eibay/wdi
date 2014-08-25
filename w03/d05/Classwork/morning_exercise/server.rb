require 'pry'
all_actors = []

file = File.read('./greys.txt')
file_array = file.split("\n")

file_array.each do |actor_string|
	actor_array = actor_string.split(",")
	hash = {}
	hash[:actor] = actor_array[0]
	hash[:character] = actor_array[1]
	# hash[:episodes] = actor_array[2].split(" ")[0].to_i -> good convention is to NOT chain like this instead:
	episode_split = actor_array[2].split(" ")
	hash[:episode] = episode_split[0].to_i

	if actor_array[3].include?("-")
		dates = actor_array[3].split("-")
		hash[:start_year] = dates[0]
		hash[:end_year] = dates[1]
	else
		hash[:start_year] = actor_array[3]
		hash[:end_year] = actor_array[3]
	end

	all_actors.push(hash)

end


