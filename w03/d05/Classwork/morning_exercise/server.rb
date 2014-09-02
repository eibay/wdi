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

# === Stars
# iterate through the array and grab every actor

stars = []

all_actors.each do |actor|
	if actor[:episodes] > 150
		stars.push(actor)
	end
end

# === minor peeps

minor = []
all_actors.each do |actor|
	if actor[:episodes] < 10
		minor.push(actor[:name])
	end
end
# === doctors

doctors = []
all_actors.each do |x|
	if x[:character].include?("Dr.")
		doctors << x[:character]
	end
end

#=== 2007

aught_seven = []

all_actors.each do |actor|
	# aught_seven << actor[:character] if actor[:start_year] -- 2007
	if actor [:start_year] <= 2007 && actor[:end_year] >= 2007
		aught_seven << actor[:character]
	end
end

