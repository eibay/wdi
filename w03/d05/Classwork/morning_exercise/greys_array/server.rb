require 'pry'

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

# == Stars

stars = []

all_actors.each do |actor|
	if actor [:episodes] > 150
		stars.push(actor)
	end
end

# == Minor peeps

minor = []

all_actors.each do |actor|
	if actor[:episodes] < 10
		minor.push(actor)
end


#doctors
doctors = []

greys_array_of_hashes.each do |x|
  if x[:character].include?("Dr.")
    doctors << x[:character]
  end

#aught_seven
aught_seven = []

all_actors.each do |actor|
	#aught_seven << actor[:character] if actor [:start_year] 2007
	if actor [:start_year] <= 2007 && actor[:end_year] 
		aught_seven << actor[:character]
	end

end









