require 'pry'
all_actors = []
stars = []
minor = []
docs = []
y2k = []
csv = File.read('./greys.txt')

file_array = csv.split("\n")

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

puts "stars, minor, docs, 2007"
command = gets.chomp.downcase
if command == "stars"
	all_actors.each do |actor|
		if actor[:episodes] > 150
			stars.push(x[:actor])
		end
	end
	puts stars
end

if command == "minor"
	all_actors.each do |x|
		if x[:episodes] < 10
			minor.push(x[:actor])
		end
	end
	puts minor.length
end

if command == "docs"
	all_actors.each do |x|
		if x[:character].include?("Dr.")
			docs.push(x[:character])
		end
	end
	puts docs
end

if command == "2007"
	all_actors.each do |x|
		if ((x[:start_year] < 2007) && (x[:end_year] >= 2007)) || (x[:start_year] == 2007)  
			y2k.push(x[:character])
		end
	end
	puts y2k.length
end










