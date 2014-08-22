require 'pry'

all_actors = []
stars = []
minors = []
doctors = []

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

all_actors.each do |actor|
	if actor[:episodes] > 150
		stars.push(actor)
	
	elsif actor[:episodes] < 10
		minors.push(actor)
	end
end
how_many_minors = minors.length
puts "there are #{how_many_minors} minor players"

all_actors.each do |x|
	if x[:character].include?("Dr.")
		doctors.push(x)
	end
end

aught_seven = {}
all_actors.each do |actor|
if actor[:start_year] <= 2007 && actor[:end_year] >= 2007
aught_seven << actor[:character]
end
end







binding.pry
